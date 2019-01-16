using System;

namespace BankAccountApp
{
    public class StudentAccount : BankAccount
    {
        public StudentAccount(string accountHolder, decimal balance, double interestRate) : base(accountHolder, balance, interestRate)
        {
        }

        public StudentAccount(string accountHolder, double interestRate = 0.01) : base(accountHolder, interestRate)
        {
        }

        public override void Withdraw(decimal amount, int totalTransactionPerMonth = 0)
        {
            Balance -= amount;
            if (totalTransactionPerMonth > 5)
                throw new Exception("Only a maximum of 5 withdrawals are allowed for the current month");
        }
    }
}