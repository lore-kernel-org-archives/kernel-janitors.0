From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 26 Jun 2015 09:04:27 +0000
Subject: re: Add support of Cavium Liquidio ethernet adapters
Message-Id: <20150626090427.GA28090@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150623142408.GA10121@mwanda>
In-Reply-To: <20150623142408.GA10121@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Raghu Vatsavayi,

The patch f21fb3ed364b: "Add support of Cavium Liquidio ethernet
adapters" from Jun 9, 2015, leads to the following static checker
warning:

	drivers/net/ethernet/cavium/liquidio/octeon_console.c:326 cvmx_bootmem_phy_named_block_find()
	error: potential null dereference 'name_tmp'.  (kmalloc returns null)

drivers/net/ethernet/cavium/liquidio/octeon_console.c
   319                  for (i = 0; i < num_blocks; i++) {
   320                          u64 named_size    321                                  CVMX_BOOTMEM_NAMED_GET_FIELD(oct, named_addr,
   322                                                               size);
   323                          if (name && named_size) {
   324                                  char *name_tmp    325                                          kmalloc(name_length + 1, GFP_KERNEL);

kmalloc can fail.

   326                                  CVMX_BOOTMEM_NAMED_GET_NAME(oct, named_addr,
   327                                                              name_tmp,
   328                                                              name_length);
   329                                  if (!strncmp(name, name_tmp, name_length)) {
   330                                          result = named_addr;
   331                                          kfree(name_tmp);
   332                                          break;
   333                                  }
   334                                  kfree(name_tmp);
   335                          } else if (!name && !named_size) {
   336                                  result = named_addr;
   337                                  break;
   338                          }
   339  
   340                          named_addr +   341                                  sizeof(struct cvmx_bootmem_named_block_desc);
   342                  }


regards,
dan carpenter
