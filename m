From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Dec 2013 21:01:40 +0000
Subject: re: GenWQE Character device and DDCB queue
Message-Id: <20131220210140.GA32504@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Frank Haverkamp,

The patch eaf4722d4645: "GenWQE Character device and DDCB queue" from 
Dec 9, 2013, leads to the following
static checker warning: "drivers/misc/genwqe/card_dev.c:657 
do_flash_update()
	 warn: maybe return -EFAULT instead of the bytes remaining?"

drivers/misc/genwqe/card_dev.c
   564                  tocopy = min_t(size_t, load->size, FLASH_BLOCK);
   565  
   566                  rc = copy_from_user(xbuf, buf, tocopy);
   567                  if (rc) {
   568                          dev_err(&pci_dev->dev,
   569                                  "err: could not copy all data rc=%d\n", rc);

There should be an "rc = -EFAULT" here.  Also printing lots of user
triggerable dev_errs() is a DoS vector.  The caller doesn't check the
error immediately; is that an information leak bug?

   570                          goto free_buffer;
   571                  }
   572                  crc = genwqe_crc32(xbuf, tocopy, 0xffffffff);
   573  
   574                  dev_info(&pci_dev->dev,
   575                           "[%s] DMA: 0x%llx CRC: %08x SZ: %ld %d\n",
   576                          __func__, dma_addr, crc, tocopy, blocks_to_flash);
   577  

regards,
dan carpenter

