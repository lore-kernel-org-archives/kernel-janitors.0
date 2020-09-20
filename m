From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 20 Sep 2020 08:54:25 +0000
Subject: Re: [PATCH] lib/scatterlist: Avoid a double memset
Message-Id: <1f0837e2-8b99-0c61-f88a-313a1f8caebb@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920071544.368841-1-christophe.jaillet@wanadoo.fr>
 <cd22db94ad43f788b158d6633a5b26b9c0aee5ba.camel@perches.com>
 <alpine.DEB.2.22.394.2009201032080.2966@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2009201032080.2966@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia.lawall@inria.fr>, Joe Perches <joe@perches.com>
Cc: akpm@linux-foundation.org, natechancellor@gmail.com, geert+renesas@glider.be, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 20/09/2020 à 10:32, Julia Lawall a écrit :
> 
> 
> On Sun, 20 Sep 2020, Joe Perches wrote:
> 
>> On Sun, 2020-09-20 at 09:15 +0200, Christophe JAILLET wrote:
>>> 'sgl' is zeroed a few lines below in 'sg_init_table()'. There is no need to
>>> clear it twice.
>>>
>>> Remove the redundant initialization.
>>
>> I didn't look very thoroughly, but there are at least
>> a few more of these with kcalloc and kzalloc like
>>
>> block/bsg-lib.c-        size_t sz = (sizeof(struct scatterlist) * req->nr_phys_segments);
>> block/bsg-lib.c-
>> block/bsg-lib.c-        BUG_ON(!req->nr_phys_segments);
>> block/bsg-lib.c-
>> block/bsg-lib.c-        buf->sg_list = kzalloc(sz, GFP_KERNEL);
>> block/bsg-lib.c-        if (!buf->sg_list)
>> block/bsg-lib.c-                return -ENOMEM;
>> block/bsg-lib.c:        sg_init_table(buf->sg_list, req->nr_phys_segments);
>> ---
>> drivers/target/target_core_rd.c-		sg = kcalloc(sg_per_table + chain_entry, sizeof(*sg),
>> drivers/target/target_core_rd.c-				GFP_KERNEL);
>> drivers/target/target_core_rd.c-		if (!sg)
>> drivers/target/target_core_rd.c-			return -ENOMEM;
>> drivers/target/target_core_rd.c-
>> drivers/target/target_core_rd.c:		sg_init_table(sg, sg_per_table + chain_entry);
>> ---
>> net/rds/rdma.c-		sg = kcalloc(nents, sizeof(*sg), GFP_KERNEL);
>> net/rds/rdma.c-		if (!sg) {
>> net/rds/rdma.c-			ret = -ENOMEM;
>> net/rds/rdma.c-			goto out;
>> net/rds/rdma.c-		}
>> net/rds/rdma.c-		WARN_ON(!nents);
>> net/rds/rdma.c:		sg_init_table(sg, nents);
> 
> I found 16 occurrences in the following files:
> 
> net/rds/rdma.c
> drivers/infiniband/hw/efa/efa_verbs.c
> drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
> drivers/misc/mic/scif/scif_nodeqp.c
> block/bsg-lib.c
> drivers/dma/sh/rcar-dmac.c
> drivers/spi/spi-topcliff-pch.c
> net/sunrpc/xprtrdma/frwr_ops.c
> drivers/dma/imx-dma.c
> drivers/pci/p2pdma.c
> drivers/dma/sh/shdma-base.c
> drivers/target/target_core_rd.c
> drivers/media/common/saa7146/saa7146_core.c
> drivers/tty/serial/pch_uart.c
> drivers/net/wireless/intel/iwlwifi/fw/dbg.c
> 
> julia
> 

Also in:
     sound/soc/sprd/sprd-pcm-dma.c
    sound/soc/sprd/sprd-pcm-compress.c
which are a bit tricky. It also uses some, IMHO, pointless devm_ functions.

Feel free to propose patches. I'm not focused on that at the moment.

CJ
