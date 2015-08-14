From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Aug 2015 09:56:52 +0000
Subject: re: nvmem: Add a simple NVMEM framework for consumers
Message-Id: <20150814095652.GB14436@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Srinivas Kandagatla,

The patch 69aba7948cbe: "nvmem: Add a simple NVMEM framework for
consumers" from Jul 27, 2015, leads to the following static checker
warning:

	drivers/nvmem/core.c:827 __nvmem_cell_read()
	warn: we tested 'cell->bit_offset' before and it was 'false'

drivers/nvmem/core.c
   816  static int __nvmem_cell_read(struct nvmem_device *nvmem,
   817                        struct nvmem_cell *cell,
   818                        void *buf, size_t *len)
   819  {
   820          int rc;
   821  
   822          rc = regmap_raw_read(nvmem->regmap, cell->offset, buf, cell->bytes);
   823  
   824          if (IS_ERR_VALUE(rc))
   825                  return rc;
   826  
   827          /* shift bits in-place */
   828          if (cell->bit_offset || cell->bit_offset)
                    ^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^
Looks like a copy and paste bug.  Maybe something else was intended?

   829                  nvmem_shift_read_buffer_in_place(cell, buf);
   830  
   831          *len = cell->bytes;
   832  
   833          return 0;
   834  }


regards,
dan carpenter
