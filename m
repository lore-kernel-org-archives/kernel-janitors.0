From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Oct 2018 10:06:53 +0000
Subject: [bug report] nvmem: add support for cell lookups from machine code
Message-Id: <20181010100653.GA8486@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Bartosz Golaszewski,

The patch 506157be06ba: "nvmem: add support for cell lookups from
machine code" from Sep 21, 2018, leads to the following static
checker warning:

	drivers/nvmem/core.c:960 nvmem_cell_get_from_lookup()
	error: 'nvmem' dereferencing possible ERR_PTR()

drivers/nvmem/core.c
   941  
   942          if (!dev)
   943                  return ERR_PTR(-EINVAL);
   944  
   945          dev_id = dev_name(dev);
   946  
   947          mutex_lock(&nvmem_lookup_mutex);
   948  
   949          list_for_each_entry(lookup, &nvmem_lookup_list, node) {
   950                  if ((strcmp(lookup->dev_id, dev_id) = 0) &&
   951                      (strcmp(lookup->con_id, con_id) = 0)) {
   952                          /* This is the right entry. */
   953                          nvmem = __nvmem_device_get(NULL, lookup->nvmem_name);
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This returns error pointers.

   954                          if (!nvmem) {
   955                                  /* Provider may not be registered yet. */
   956                                  cell = ERR_PTR(-EPROBE_DEFER);
   957                                  goto out;
   958                          }
   959  
   960                          cell = nvmem_find_cell_by_name(nvmem,
   961                                                         lookup->cell_name);
   962                          if (!cell) {
   963                                  __nvmem_device_put(nvmem);
   964                                  goto out;
                                        ^^^^^^^^
We probably want to set the error code on this path.

   965                          }
   966                  }
   967          }
   968  
   969  out:
   970          mutex_unlock(&nvmem_lookup_mutex);
   971          return cell;
   972  }
   973  

regards,
dan carpenter
