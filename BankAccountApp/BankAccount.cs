using System;
using System.Collections.Generic;
using System.Linq;

namespace BankAccountApp
{
    public class BankAccount
    {
        protected string AccountHolder;
        protected double InterestRate;
        protected decimal Balance;
        protected IEnumerable<Transaction> Transactions;
        public BankAccount(string accountHolder, decimal balance, double interestRate)
        {
            this.AccountHolder = accountHolder;
            this.InterestRate = interestRate;
            this.Balance = balance;
            Transactions = new List<Transaction>();
        }

        public BankAccount(string accountHolder, double interestRate = 0.01) :
            this(accountHolder, 0.0M, interestRate)
        {
            Transactions = new List<Transaction>();
        }

        public virtual decimal BankBalance => Balance;

        public virtual void Withdraw(decimal amount, int totalTransactionPerMonth = 0)
        {
            Balance -= amount;
        }

        public virtual void Deposit(decimal amount, decimal totalDeposit = 0)
        {
            Balance += amount;
        }

        public virtual double CurrentInterestRate => InterestRate;

        public virtual IEnumerable<Transaction> GetTransactions(DateTime startDate, DateTime endDate)

        {
            return Transactions.Where(x=>x.Date>=startDate && x.Date<=endDate);

        }

        public class Transaction
        {
            public DateTime Date { get; set; }
            public decimal Amount { get; set; }
            public TransactionMode TransactionType { get; set; }
            public int AccountId { get; set; }
        }
    }
}