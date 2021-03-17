using Data.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Data.Repositories.Implement;
using Data.Repositories;
namespace Business.Service
{
    public interface IOrderService
    {
        void add(Order product);
        void update(Order product);
        void delele(Order product);
        void delete(int id);
        Order findById(int id);
        IEnumerable<Order> findAll();
        IEnumerable<Order> findAll(string[] inclues);
        public void Save();
    }
    public class OrderService : IOrderService
    {
        IOrderRepository orderRepository;
        IUnitOfWork unitOfWork;

        public OrderService(IOrderRepository orderRepository, IUnitOfWork unitOfWork)
        {
            this.orderRepository = orderRepository;
            this.unitOfWork = unitOfWork;
        }


        public void add(Order product)
        {
            orderRepository.add(product);
        }

        public void delele(Order product)
        {
            orderRepository.delete(product);
        }

        public void delete(int id)
        {
            orderRepository.delete(id);
        }

        public IEnumerable<Order> findAll()
        {
            var orders = orderRepository.findAll();
            return orders;
        }

        public IEnumerable<Order> findAll(string[] inclues)
        {
            var orders = orderRepository.findAll(inclues);
            return orders;
        }

        public Order findById(int id)
        {
            var orders = orderRepository.findById(id);
            return orders;
        }

        public void Save()
        {
            unitOfWork.commit();
        }

        public void update(Order product)
        {
            orderRepository.update(product);
        }
    }
}
