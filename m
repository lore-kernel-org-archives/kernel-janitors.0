From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 12 Sep 2015 19:50:30 +0000
Subject: re: dma-mapping: consolidate dma_{alloc,free}_{attrs,coherent}
Message-Id: <20150912195030.GB10112@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Christoph Hellwig,

This is a semi-automatic email about new static checker warnings.

The patch 60ff3365096f: "dma-mapping: consolidate
dma_{alloc,free}_{attrs,coherent}" from Aug 25, 2015, leads to the
following Smatch complaint:

arch/x86/kernel/pci-dma.c:137 arch_dma_alloc_attrs()
	 warn: variable dereferenced before check '*dev' (see line 134)

arch/x86/kernel/pci-dma.c
   133	{
   134		*gfp = dma_alloc_coherent_gfp_flags(*dev, *gfp);
                                                    ^^^^
Dereferenced inside function call.

   135		*gfp &= ~(__GFP_DMA | __GFP_HIGHMEM | __GFP_DMA32);
   136	
   137		if (!*dev)
                    ^^^^^
Too late.

   138			*dev = &x86_dma_fallback_dev;
   139		if (!is_device_dma_capable(*dev))

regards,
dan carpenter
