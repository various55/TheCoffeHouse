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
    public interface ITransactionService
    {
        void add(Transaction transaction);
        void update(Transaction transaction);
        void delele(Transaction transaction);
        void delete(int id);
        Transaction findById(int id);
        IEnumerable<Transaction> findAll();
        IEnumerable<Transaction> findAll(string[] inclues);
        public void Save();
    }
    public class TransactionService : ITransactionService
    {
        ITransactionRepository transactionRepository;
        IUnitOfWork unitOfWork;

        public TransactionService(ITransactionRepository transactionRepository, IUnitOfWork unitOfWork)
        {
            this.transactionRepository = transactionRepository;
            this.unitOfWork = unitOfWork;
        }


        public void add(Transaction transaction)
        {
            transactionRepository.add(transaction);
        }

        public void delele(Transaction transaction)
        {
            transactionRepository.delete(transaction);
        }

        public void delete(int id)
        {
            transactionRepository.delete(id);
        }

        public IEnumerable<Transaction> findAll()
        {
            var transactions = transactionRepository.findAll();
            return transactions;
        }

        public IEnumerable<Transaction> findAll(string[] inclues)
        {
            var transactions = transactionRepository.findAll(inclues);
            return transactions;
        }

        public Transaction findById(int id)
        {
            var transaction = transactionRepository.findById(id);
            return transaction;
        }

        public void Save()
        {
            unitOfWork.commit();
        }

        public void update(Transaction transaction)
        {
            transactionRepository.update(transaction);
        }
    }
}
