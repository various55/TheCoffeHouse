namespace Data
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class MyDbContext : System.Data.Entity.DbContext
    {
        public MyDbContext()
            : base("name=TheCoffeeHouseDb")
        {
        }

        public virtual DbSet<Action> Actions { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Function> Functions { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<ShopConfig> ShopConfigs { get; set; }
        public virtual DbSet<Status> Status { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Transaction> Transactions { get; set; }
        public virtual DbSet<Type> Types { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<UserRole> UserRoles { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Action>()
                .HasMany(e => e.Permissions)
                .WithRequired(e => e.Action)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Products)
                .WithRequired(e => e.Category)
                .HasForeignKey(e => e.categoriesId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Function>()
                .HasMany(e => e.Permissions)
                .WithRequired(e => e.Function)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.Transactions)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.image)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Product)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Product>()
                .HasMany(e => e.Status)
                .WithMany(e => e.Products)
                .Map(m => m.ToTable("ProductStatus").MapLeftKey("productId").MapRightKey("statusId"));

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Permissions)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.UserRoles)
                .WithRequired(e => e.Role)
                .HasForeignKey(e => e.userId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.imageLogo)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.mobile)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.gmail)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.facebook)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.instagram)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.twitter)
                .IsUnicode(false);

            modelBuilder.Entity<ShopConfig>()
                .Property(e => e.youtube)
                .IsUnicode(false);

            modelBuilder.Entity<Type>()
                .HasMany(e => e.Orders)
                .WithRequired(e => e.Type)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.username)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.password)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.phoneNumber)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .Property(e => e.email)
                .IsFixedLength();

            modelBuilder.Entity<User>()
                .HasMany(e => e.UserRoles)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            base.OnModelCreating(modelBuilder);
        }
    }
}
