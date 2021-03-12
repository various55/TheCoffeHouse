namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Database : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Actions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Permissions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        roleId = c.Int(nullable: false),
                        functionId = c.Int(nullable: false),
                        actionId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Functions", t => t.functionId)
                .ForeignKey("dbo.Roles", t => t.actionId)
                .ForeignKey("dbo.Actions", t => t.roleId)
                .Index(t => t.roleId)
                .Index(t => t.functionId)
                .Index(t => t.actionId);
            
            CreateTable(
                "dbo.Functions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        url = c.String(maxLength: 255),
                        parentId = c.Int(),
                        status = c.Boolean(),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Roles",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.UserRoles",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        userId = c.Int(nullable: false),
                        roleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Users", t => t.userId)
                .ForeignKey("dbo.Roles", t => t.userId)
                .Index(t => t.userId);

            CreateTable(
                "dbo.Users",
                c => new
                {
                    id = c.Int(nullable: false, identity: true),
                    username = c.String(maxLength: 25, fixedLength: true),
                    password = c.String(maxLength: 256, fixedLength: true),
                    role = c.Int(),
                    phoneNumber = c.String(maxLength: 20, fixedLength: true),
                    email = c.String(maxLength: 50, fixedLength: true),
                    DOB = c.DateTime(storeType: "date"),
                    address = c.String(maxLength: 50),
                    total = c.Double(),
                    status = c.Boolean(),
                    name = c.String(nullable: false, maxLength: 56),
                })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Transactions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        userId = c.Int(nullable: false),
                        orderId = c.Int(nullable: false),
                        createdBy = c.Int(),
                        createdAt = c.DateTime(),
                        message = c.String(maxLength: 255),
                        status = c.Boolean(),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Orders", t => t.orderId)
                .ForeignKey("dbo.Users", t => t.userId, cascadeDelete: true)
                .Index(t => t.userId)
                .Index(t => t.orderId);
            
            CreateTable(
                "dbo.Orders",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        createdBy = c.Int(nullable: false),
                        userId = c.Int(nullable: false),
                        orderDate = c.DateTime(nullable: false),
                        shipName = c.String(maxLength: 50),
                        shipAddress = c.String(maxLength: 255),
                        shipPhoneNumber = c.String(maxLength: 20),
                        status = c.Int(nullable: false),
                        typeId = c.Int(nullable: false),
                        fee = c.Double(),
                        discount = c.Double(),
                        total = c.Double(),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Types", t => t.typeId)
                .Index(t => t.typeId);
            
            CreateTable(
                "dbo.OrderDetails",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        orderId = c.Int(nullable: false),
                        productId = c.Int(nullable: false),
                        quantity = c.Int(),
                        price = c.Double(),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Products", t => t.productId)
                .ForeignKey("dbo.Orders", t => t.orderId)
                .Index(t => t.orderId)
                .Index(t => t.productId);
            
            CreateTable(
                "dbo.Products",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        description = c.String(maxLength: 255),
                        price = c.Double(),
                        details = c.String(storeType: "ntext"),
                        isShowOnHome = c.Boolean(),
                        discount = c.Double(),
                        quantityOrder = c.Int(defaultValue:0),
                        image = c.String(maxLength: 255, unicode: false),
                        categoriesId = c.Int(nullable: false),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id)
                .ForeignKey("dbo.Categories", t => t.categoriesId)
                .Index(t => t.categoriesId);
            
            CreateTable(
                "dbo.Categories",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        isShowOnHome = c.Boolean(),
                        status = c.Boolean(),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Status",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Types",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.ShopConfig",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        shopName = c.String(maxLength: 50),
                        imageLogo = c.String(maxLength: 255, unicode: false),
                        mobile = c.String(maxLength: 50, unicode: false),
                        address = c.String(maxLength: 255),
                        gmail = c.String(maxLength: 50, unicode: false),
                        facebook = c.String(maxLength: 255, unicode: false),
                        instagram = c.String(maxLength: 255, unicode: false),
                        twitter = c.String(maxLength: 255, unicode: false),
                        youtube = c.String(maxLength: 255, unicode: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.sysdiagrams",
                c => new
                    {
                        diagram_id = c.Int(nullable: false, identity: true),
                        name = c.String(nullable: false, maxLength: 128),
                        principal_id = c.Int(nullable: false),
                        version = c.Int(),
                        definition = c.Binary(),
                    })
                .PrimaryKey(t => t.diagram_id);
            
            CreateTable(
                "dbo.ProductStatus",
                c => new
                    {
                        productId = c.Int(nullable: false),
                        statusId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => new { t.productId, t.statusId })
                .ForeignKey("dbo.Products", t => t.productId, cascadeDelete: true)
                .ForeignKey("dbo.Status", t => t.statusId, cascadeDelete: true)
                .Index(t => t.productId)
                .Index(t => t.statusId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Permissions", "roleId", "dbo.Actions");
            DropForeignKey("dbo.Users", "Role_id", "dbo.Roles");
            DropForeignKey("dbo.UserRoles", "userId", "dbo.Roles");
            DropForeignKey("dbo.UserRoles", "userId", "dbo.Users");
            DropForeignKey("dbo.Transactions", "userId", "dbo.Users");
            DropForeignKey("dbo.Orders", "typeId", "dbo.Types");
            DropForeignKey("dbo.Transactions", "orderId", "dbo.Orders");
            DropForeignKey("dbo.OrderDetails", "orderId", "dbo.Orders");
            DropForeignKey("dbo.ProductStatus", "statusId", "dbo.Status");
            DropForeignKey("dbo.ProductStatus", "productId", "dbo.Products");
            DropForeignKey("dbo.OrderDetails", "productId", "dbo.Products");
            DropForeignKey("dbo.Products", "categoriesId", "dbo.Categories");
            DropForeignKey("dbo.Permissions", "actionId", "dbo.Roles");
            DropForeignKey("dbo.Permissions", "functionId", "dbo.Functions");
            DropIndex("dbo.ProductStatus", new[] { "statusId" });
            DropIndex("dbo.ProductStatus", new[] { "productId" });
            DropIndex("dbo.Products", new[] { "categoriesId" });
            DropIndex("dbo.OrderDetails", new[] { "productId" });
            DropIndex("dbo.OrderDetails", new[] { "orderId" });
            DropIndex("dbo.Orders", new[] { "typeId" });
            DropIndex("dbo.Transactions", new[] { "orderId" });
            DropIndex("dbo.Transactions", new[] { "userId" });
            DropIndex("dbo.Users", new[] { "Role_id" });
            DropIndex("dbo.UserRoles", new[] { "userId" });
            DropIndex("dbo.Permissions", new[] { "actionId" });
            DropIndex("dbo.Permissions", new[] { "functionId" });
            DropIndex("dbo.Permissions", new[] { "roleId" });
            DropTable("dbo.ProductStatus");
            DropTable("dbo.sysdiagrams");
            DropTable("dbo.ShopConfig");
            DropTable("dbo.Types");
            DropTable("dbo.Status");
            DropTable("dbo.Categories");
            DropTable("dbo.Products");
            DropTable("dbo.OrderDetails");
            DropTable("dbo.Orders");
            DropTable("dbo.Transactions");
            DropTable("dbo.Users");
            DropTable("dbo.UserRoles");
            DropTable("dbo.Roles");
            DropTable("dbo.Functions");
            DropTable("dbo.Permissions");
            DropTable("dbo.Actions");
        }
    }
}
