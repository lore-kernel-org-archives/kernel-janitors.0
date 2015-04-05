From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Apr 2015 12:06:30 +0000
Subject: [PATCH 10/16] zram: fix error return code
Message-Id: <1428235596-4757-11-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1428235596-4757-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Minchan Kim <minchan@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>, linux-kernel@vger.kernel.org

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/block/zram/zram_drv.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/zram/zram_drv.c b/drivers/block/zram/zram_drv.c
index 759ee09..fe67ebb 100644
--- a/drivers/block/zram/zram_drv.c
+++ b/drivers/block/zram/zram_drv.c
@@ -1188,6 +1188,7 @@ static int zram_add(int device_id)
 	if (!queue) {
 		pr_err("Error allocating disk queue for device %d\n",
 			device_id);
+		ret = -ENOMEM;
 		goto out_free_idr;
 	}
 
@@ -1198,6 +1199,7 @@ static int zram_add(int device_id)
 	if (!zram->disk) {
 		pr_warn("Error allocating disk structure for device %d\n",
 			device_id);
+		ret = -ENOMEM;
 		goto out_free_queue;
 	}
 

