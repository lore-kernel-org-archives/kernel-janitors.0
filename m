From: Joe Perches <joe@perches.com>
Date: Sun, 20 Sep 2020 07:28:38 +0000
Subject: Re: [PATCH] lib/scatterlist: Avoid a double memset
Message-Id: <cd22db94ad43f788b158d6633a5b26b9c0aee5ba.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920071544.368841-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200920071544.368841-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, akpm@linux-foundation.org, natechancellor@gmail.com, geert+renesas@glider.be
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 2020-09-20 at 09:15 +0200, Christophe JAILLET wrote:
> 'sgl' is zeroed a few lines below in 'sg_init_table()'. There is no need to
> clear it twice.
> 
> Remove the redundant initialization.

I didn't look very thoroughly, but there are at least
a few more of these with kcalloc and kzalloc like

block/bsg-lib.c-        size_t sz = (sizeof(struct scatterlist) * req->nr_phys_segments);
block/bsg-lib.c-
block/bsg-lib.c-        BUG_ON(!req->nr_phys_segments);
block/bsg-lib.c-
block/bsg-lib.c-        buf->sg_list = kzalloc(sz, GFP_KERNEL);
block/bsg-lib.c-        if (!buf->sg_list)
block/bsg-lib.c-                return -ENOMEM;
block/bsg-lib.c:        sg_init_table(buf->sg_list, req->nr_phys_segments);
---
drivers/target/target_core_rd.c-		sg = kcalloc(sg_per_table + chain_entry, sizeof(*sg),
drivers/target/target_core_rd.c-				GFP_KERNEL);
drivers/target/target_core_rd.c-		if (!sg)
drivers/target/target_core_rd.c-			return -ENOMEM;
drivers/target/target_core_rd.c-
drivers/target/target_core_rd.c:		sg_init_table(sg, sg_per_table + chain_entry);
---
net/rds/rdma.c-		sg = kcalloc(nents, sizeof(*sg), GFP_KERNEL);
net/rds/rdma.c-		if (!sg) {
net/rds/rdma.c-			ret = -ENOMEM;
net/rds/rdma.c-			goto out;
net/rds/rdma.c-		}
net/rds/rdma.c-		WARN_ON(!nents);
net/rds/rdma.c:		sg_init_table(sg, nents);
