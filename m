From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 14 Aug 2012 12:58:31 +0000
Subject: [PATCH 1/5] drivers/cdrom/gdrom.c: fix error return code
Message-Id: <1344949115-13266-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344949115-13266-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Convert a 0 error return code to a negative one, as returned elsewhere in the
function.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret;
expression e,e1,e2,e3,e4,x;
@@

(
if (\(ret != 0\|ret < 0\) || ...) { ... return ...; }
|
ret = 0
)
... when != ret = e1
*x = \(kmalloc\|kzalloc\|kcalloc\|devm_kzalloc\|ioremap\|ioremap_nocache\|devm_ioremap\|devm_ioremap_nocache\)(...);
... when != x = e2
    when != ret = e3
*if (x = NULL || ...)
{
  ... when != ret = e4
*  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/cdrom/gdrom.c |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/cdrom/gdrom.c b/drivers/cdrom/gdrom.c
index 3ceaf00..f05863b 100644
--- a/drivers/cdrom/gdrom.c
+++ b/drivers/cdrom/gdrom.c
@@ -808,16 +808,20 @@ static int __devinit probe_gdrom(struct platform_device *devptr)
 	if (err)
 		goto probe_fail_cmdirq_register;
 	gd.gdrom_rq = blk_init_queue(gdrom_request, &gdrom_lock);
-	if (!gd.gdrom_rq)
+	if (!gd.gdrom_rq) {
+		err = -ENOMEM;
 		goto probe_fail_requestq;
+	}
 
 	err = probe_gdrom_setupqueue();
 	if (err)
 		goto probe_fail_toc;
 
 	gd.toc = kzalloc(sizeof(struct gdromtoc), GFP_KERNEL);
-	if (!gd.toc)
+	if (!gd.toc) {
+		err = -ENOMEM;
 		goto probe_fail_toc;
+	}
 	add_disk(gd.disk);
 	return 0;
 

