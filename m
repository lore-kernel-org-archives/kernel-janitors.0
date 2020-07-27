From: <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 10:32:10 +0000
Subject: [bug report] qed: sanitize PBL chains allocation
Message-Id: <20200727103210.GA375660@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Alexander Lobakin,

The patch 9b6ee3cf95d3: "qed: sanitize PBL chains allocation" from
Jul 23, 2020, leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_chain.c:299 qed_chain_alloc_pbl()
	error: uninitialized symbol 'pbl_virt'.

drivers/net/ethernet/qlogic/qed/qed_chain.c
   249  static int qed_chain_alloc_pbl(struct qed_dev *cdev, struct qed_chain *chain)
   250  {
   251          struct device *dev = &cdev->pdev->dev;
   252          struct addr_tbl_entry *addr_tbl;
   253          dma_addr_t phys, pbl_phys;
   254          __le64 *pbl_virt;
                ^^^^^^^^^^^^^^^^

   255          u32 page_cnt, i;
   256          size_t size;
   257          void *virt;
   258  
   259          page_cnt = chain->page_cnt;
   260  
   261          size = array_size(page_cnt, sizeof(*addr_tbl));
   262          if (unlikely(size = SIZE_MAX))
   263                  return -EOVERFLOW;
   264  
   265          addr_tbl = vzalloc(size);
   266          if (!addr_tbl)
   267                  return -ENOMEM;
   268  
   269          chain->pbl.pp_addr_tbl = addr_tbl;
   270  
   271          if (chain->b_external_pbl)
   272                  goto alloc_pages;
                        ^^^^^^^^^^^^^^^^
uninitialized

   273  
   274          size = array_size(page_cnt, sizeof(*pbl_virt));
   275          if (unlikely(size = SIZE_MAX))
   276                  return -EOVERFLOW;
   277  
   278          pbl_virt = dma_alloc_coherent(dev, size, &pbl_phys, GFP_KERNEL);
   279          if (!pbl_virt)
   280                  return -ENOMEM;
   281  
   282          chain->pbl_sp.table_virt = pbl_virt;
   283          chain->pbl_sp.table_phys = pbl_phys;
   284          chain->pbl_sp.table_size = size;
   285  
   286  alloc_pages:
   287          for (i = 0; i < page_cnt; i++) {
   288                  virt = dma_alloc_coherent(dev, chain->page_size, &phys,
   289                                            GFP_KERNEL);
   290                  if (!virt)
   291                          return -ENOMEM;
   292  
   293                  if (i = 0) {
   294                          qed_chain_init_mem(chain, virt, phys);
   295                          qed_chain_reset(chain);
   296                  }
   297  
   298                  /* Fill the PBL table with the physical address of the page */
   299                  pbl_virt[i] = cpu_to_le64(phys);
                        ^^^^^^^^^^^
   300  
   301                  /* Keep the virtual address of the page */
   302                  addr_tbl[i].virt_addr = virt;
   303                  addr_tbl[i].dma_map = phys;
   304          }
   305  
   306          return 0;
   307  }

regards,
dan carpenter
