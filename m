From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 07 Dec 2012 06:19:43 +0000
Subject: [patch] aoe: use after free in aoedev_by_aoeaddr()
Message-Id: <20121207061943.GC18220@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Ed L. Cashin" <ecashin@coraid.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return NULL on failure instead of returning a freed pointer.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/aoe/aoedev.c b/drivers/block/aoe/aoedev.c
index e66ccbf..98f2965 100644
--- a/drivers/block/aoe/aoedev.c
+++ b/drivers/block/aoe/aoedev.c
@@ -461,6 +461,7 @@ aoedev_by_aoeaddr(ulong maj, int min, int do_alloc)
 	d->targets = kcalloc(NTARGETS, sizeof(*d->targets), GFP_ATOMIC);
 	if (!d->targets) {
 		kfree(d);
+		d = NULL;
 		goto out;
 	}
 	d->ntargets = NTARGETS;
