namespace Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DeletePermission : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Permissions", "functionId", "dbo.Functions");
            DropForeignKey("dbo.Permissions", "roleId", "dbo.Roles");
            DropForeignKey("dbo.UserRoles", "userId", "dbo.Users");
            DropForeignKey("dbo.UserRoles", "userId", "dbo.Roles");
            DropForeignKey("dbo.Users", "Role_id", "dbo.Roles");
            DropForeignKey("dbo.Permissions", "actionId", "dbo.Actions");
            DropIndex("dbo.Permissions", new[] { "roleId" });
            DropIndex("dbo.Permissions", new[] { "functionId" });
            DropIndex("dbo.Permissions", new[] { "actionId" });
            DropIndex("dbo.UserRoles", new[] { "userId" });
            DropIndex("dbo.Users", new[] { "Role_id" });
            DropColumn("dbo.Users", "Role_id");
            DropTable("dbo.Permissions");
            DropTable("dbo.Actions");
            DropTable("dbo.Functions");
            DropTable("dbo.UserRoles");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.UserRoles",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        userId = c.Int(nullable: false),
                        roleId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
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
                "dbo.Permissions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        roleId = c.Int(nullable: false),
                        functionId = c.Int(nullable: false),
                        actionId = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.id);
            
            CreateTable(
                "dbo.Actions",
                c => new
                    {
                        id = c.Int(nullable: false, identity: true),
                        test = c.Int(nullable: false),
                        name = c.String(nullable: false, maxLength: 56),
                    })
                .PrimaryKey(t => t.id);
            
            AddColumn("dbo.Users", "Role_id", c => c.Int());
            CreateIndex("dbo.Users", "Role_id");
            CreateIndex("dbo.UserRoles", "userId");
            CreateIndex("dbo.Permissions", "actionId");
            CreateIndex("dbo.Permissions", "functionId");
            CreateIndex("dbo.Permissions", "roleId");
            AddForeignKey("dbo.Permissions", "actionId", "dbo.Actions", "id");
            AddForeignKey("dbo.Users", "Role_id", "dbo.Roles", "id");
            AddForeignKey("dbo.UserRoles", "userId", "dbo.Roles", "id");
            AddForeignKey("dbo.UserRoles", "userId", "dbo.Users", "id");
            AddForeignKey("dbo.Permissions", "roleId", "dbo.Roles", "id");
            AddForeignKey("dbo.Permissions", "functionId", "dbo.Functions", "id");
        }
    }
}
