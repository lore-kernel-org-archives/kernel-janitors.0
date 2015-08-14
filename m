From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date: Fri, 14 Aug 2015 10:06:54 +0000
Subject: Re: nvmem: Add a simple NVMEM framework for consumers
Message-Id: <55CDBDBE.2080403@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150814095652.GB14436@mwanda>
In-Reply-To: <20150814095652.GB14436@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks Dan,

for reporting this.
On 14/08/15 10:56, Dan Carpenter wrote:
> Hello Srinivas Kandagatla,
>
> The patch 69aba7948cbe: "nvmem: Add a simple NVMEM framework for
> consumers" from Jul 27, 2015, leads to the following static checker
> warning:
>
> 	drivers/nvmem/core.c:827 __nvmem_cell_read()
> 	warn: we tested 'cell->bit_offset' before and it was 'false'
>
> drivers/nvmem/core.c
>     816  static int __nvmem_cell_read(struct nvmem_device *nvmem,
>     817                        struct nvmem_cell *cell,
>     818                        void *buf, size_t *len)
>     819  {
>     820          int rc;
>     821
>     822          rc = regmap_raw_read(nvmem->regmap, cell->offset, buf, cell->bytes);
>     823
>     824          if (IS_ERR_VALUE(rc))
>     825                  return rc;
>     826
>     827          /* shift bits in-place */
>     828          if (cell->bit_offset || cell->bit_offset)
>                      ^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^
> Looks like a copy and paste bug.  Maybe something else was intended?

Yes, its a copy paste error, I can be fixed by below patch which am 
going to send to Greg to pick up.


------------------>snip<-------------------------

Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Date:   Fri Aug 14 11:00:57 2015 +0100

     nvmem: core: fix a copy paste error

     This patch fixes a copy paste error in a check which is performed to
     determine if the cell is specified in bits or not.

     Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
     Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 35a42bb..ea0d6fd 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -825,7 +825,7 @@ static int __nvmem_cell_read(struct nvmem_device *nvmem,
                 return rc;

         /* shift bits in-place */
-       if (cell->bit_offset || cell->bit_offset)
+       if (cell->bit_offset || cell->nbits)
                 nvmem_shift_read_buffer_in_place(cell, buf);

         *len = cell->bytes;

------------------>snip<-------------------------


--srini
>
>     829                  nvmem_shift_read_buffer_in_place(cell, buf);
>     830
>     831          *len = cell->bytes;
>     832
>     833          return 0;
>     834  }
>
>
> regards,
> dan carpenter
>
