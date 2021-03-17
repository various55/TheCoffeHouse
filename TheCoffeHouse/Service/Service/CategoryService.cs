using Data.EF;
using Data.Repositories;
using Data.Repositories.Implement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business.Service
{
    public interface ICategoryService
    {
        void add(Category category);
        void update(Category category);
        void delete(int id);
        Category findById(int id);
        IEnumerable<Category> findAll();
        IEnumerable<Category> findAll(string[] inclues);
        public void Save();
    }
    public class CategoryService : ICategoryService
    {
        ICategoryRepository categoryRepository;
        IUnitOfWork unitOfWork;

        public CategoryService()
        {

        }

        public CategoryService(ICategoryRepository categoryRepository, IUnitOfWork unitOfWork)
        {
            this.categoryRepository = categoryRepository;
            this.unitOfWork = unitOfWork;
        }
        public void add(Category category)
        {
            categoryRepository.add(category);
        }
        public void delete(int id)
        {
            categoryRepository.delete(id);
        }

        public IEnumerable<Category> findAll()
        {
            var categories = categoryRepository.findAll();
            return categories;
        }

        public IEnumerable<Category> findAll(string[] inclues)
        {
            var categories = categoryRepository.findAll(inclues);
            return categories;
        }

        public Category findById(int id)
        {
            var category = categoryRepository.findById(id);
            return category;
        }

        public void Save()
        {
            unitOfWork.commit();
        }

        public void update(Category category)
        {
            categoryRepository.update(category);
        }
    }
}
