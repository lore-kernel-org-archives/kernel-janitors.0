From: Frank Haverkamp <haver@linux.vnet.ibm.com>
Date: Sat, 21 Dec 2013 19:40:39 +0000
Subject: re: GenWQE Character device and DDCB queue
Message-Id: <1387654839.7788.10.camel@oc7383187364.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131220210140.GA32504@elgon.mountain>
In-Reply-To: <20131220210140.GA32504@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

Am Samstag, den 21.12.2013, 00:01 +0300 schrieb Dan Carpenter:
> Hello Frank Haverkamp,
> 
> The patch eaf4722d4645: "GenWQE Character device and DDCB queue" from 
> Dec 9, 2013, leads to the following
> static checker warning: "drivers/misc/genwqe/card_dev.c:657 
> do_flash_update()
> 	 warn: maybe return -EFAULT instead of the bytes remaining?"
> 
> drivers/misc/genwqe/card_dev.c
>    564                  tocopy = min_t(size_t, load->size, FLASH_BLOCK);
>    565  
>    566                  rc = copy_from_user(xbuf, buf, tocopy);
>    567                  if (rc) {
>    568                          dev_err(&pci_dev->dev,
>    569                                  "err: could not copy all data rc=%d\n", rc);
> 
> There should be an "rc = -EFAULT" here. 

Yes, that is better. I will fix that.

>  Also printing lots of user
> triggerable dev_errs() is a DoS vector. 

Ok. Either I will remove or turn those into dev_dbg. Thanks for pointing
this out.

>  The caller doesn't check the
> error immediately; is that an information leak bug?

I think it is ok the way it is. The hardware returns retc, progress and
attn. The user likes to have those in addition to rc to know why the
call failed:

	rc = do_flash_update(cfile, &load);

	if (copy_to_user((void __user *)arg, &load, sizeof(load))) {
		dev_err(&pci_dev->dev,
			"err: could not copy params to user\n");
		return -EFAULT;
	}
	dev_info(&pci_dev->dev, "[%s] rc=%d\n", __func__, rc);
	return rc;

I will remove or convert the dev_info() calls too.

> 
>    570                          goto free_buffer;
>    571                  }
>    572                  crc = genwqe_crc32(xbuf, tocopy, 0xffffffff);
>    573  
>    574                  dev_info(&pci_dev->dev,
>    575                           "[%s] DMA: 0x%llx CRC: %08x SZ: %ld %d\n",
>    576                          __func__, dma_addr, crc, tocopy, blocks_to_flash);
>    577  
> 
> regards,
> dan carpenter

Thanks for reviewing and checking our code.

Regards

Frank


