using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using UniserGroupTask.Models;

namespace UniserGroupTask.Data
{
    public class AppDbContext : IdentityDbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }


        public DbSet<ApplicationUser> Users { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<ApplicationRole> ApplicationRoles { get; set; }
        public DbSet<ApplicationUserRole> ApplicationUserRoles { get; set; }


        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);


            builder.Entity<ApplicationUser>()
               .HasMany(au => au.Addresses)
               .WithOne(a => a.ApplicationUser)
               .HasForeignKey(au => au.ApplicationUserId)
               .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
