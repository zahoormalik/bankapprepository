namespace BankAccountApp
{
    public class SavingsAccount : BankAccount
    {
        public SavingsAccount(string accountHolder, decimal balance, double interestRate) : base(accountHolder, balance, interestRate)
        {
        }

        public SavingsAccount(string accountHolder, double interestRate = 0.01) : base(accountHolder, interestRate)
        {
        }

        public override void Withdraw(decimal amount, int totalTransactionPerMonth = 0)
        {
            Balance -= amount;
            if (totalTransactionPerMonth > 3)
                InterestRate = 0;
        }
        public override void Deposit(decimal amount, decimal totalDepositPerMonth = 0)
        {
            Balance += amount;
            if (totalDepositPerMonth > 10000)
                InterestRate = 0.03;
        }



    }
}