using Business.ModelView;
using Data.EF;
using Data.Repositories;
using Data.Repositories.Implement;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Service
{
    public interface IProductService 
    {
        void add(Product product);
        void update(Product product);
        void delele(Product product);
        void delete(int id);
        Product findById(int id);
        IEnumerable<Product> findAll();
        IEnumerable<Product> findAll(string[] inclues);
        IEnumerable<Product> findByCategoryId(int id);

        ResponseData<Product> FilterAndPagination(RequestData request);

        public void Save();
    }
    public class ProductService : IProductService
    {
        IProductRepository productRepository;
        IUnitOfWork unitOfWork;

        public ProductService(IProductRepository productRepository, IUnitOfWork unitOfWork)
        {
            this.productRepository = productRepository;
            this.unitOfWork = unitOfWork;
        }

        public void add(Product product)
        {
            try
            {
                productRepository.add(product);
            }catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void delele(Product product)
        {
            try
            {
                productRepository.delete(product);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public void delete(int id)
        {
            try
            {
                productRepository.delete(id);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
            }
        }

        public ResponseData<Product> FilterAndPagination(RequestData request)
        {
            int size = (int)request.pageSize;
            int idCategory = (int)request.idCategory;
            int pageNumber = (int)request.pageNumber;
            string search = request.search;
            string sort = request.sortBy;
            bool isAsc = (bool) request.isAsc;

            var products = productRepository.findAll();

            if (!String.IsNullOrEmpty(sort))
            {
                sort = sort.ToLower();
            }
            switch (sort)
            {
                case "name":
                    products = products.OrderBy(p => p.name).ToList();
                    break;
                case "price":
                    products = products.OrderBy(p => p.price).ToList();
                    break;
                default:
                    products = products.OrderBy(p => p.id).ToList();
                    break;
            }
            var total = productRepository.findAll().Count();
            if (idCategory > 0)
            {
                products = products.Where(p => p.categoriesId == idCategory);
            }
            if (!String.IsNullOrEmpty(search))
            {
                search = search.ToLower();
                products = products.Where(x => x.name.ToLower().Contains(search));
            }
            total = products.Count();
            products = products.Skip(size * (pageNumber - 1)).Take(size);
            ResponseData<Product> response = new ResponseData<Product>();
            response.data = products.ToList();
            response.pageNumber = pageNumber;
            response.pageSize = size;
            response.pageCount = (int) Math.Ceiling((double)total / size);
            return response;
        }

        public IEnumerable<Product> findAll(string[] inclues)
        {
            try
            {
                return productRepository.findAll(inclues);
            }
            catch (SqlException e)
            {
                Console.WriteLine(e.Message);
                return new List<Product>();
            }
        }

        public IEnumerable<Product> findAll()
        {
            return productRepository.findAll();
        }

        public IEnumerable<Product> findByCategoryId(int id)
        {
            var products = productRepository.findAll().Where(p => p.categoriesId == id).ToList();
            return products;
        }

        public Product findById(int id)
        {
            return productRepository.findById(id);
        }

        public void Save()
        {
            unitOfWork.commit();
        }

        public void update(Product product)
        {
            productRepository.update(product);
        }
    }
}
