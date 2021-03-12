namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddAnnotation : DbMigration
    {
        public override void Up()
        {
            AlterColumn("dbo.Products", "price", c => c.Double(nullable: false));
            AlterColumn("dbo.Products", "isShowOnHome", c => c.Boolean(nullable: false,defaultValue:true));
            AlterColumn("dbo.Products", "discount", c => c.Double(nullable: false,defaultValue:0));
            AlterColumn("dbo.Products", "quantityOrder", c => c.Int(defaultValue: 0));
        }
        
        public override void Down()
        {
            AlterColumn("dbo.Products", "discount", c => c.Double());
            AlterColumn("dbo.Products", "isShowOnHome", c => c.Boolean());
            AlterColumn("dbo.Products", "price", c => c.Double());
        }
    }
}
