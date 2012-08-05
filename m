From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 05 Aug 2012 09:52:31 +0000
Subject: [PATCH 1/6] drivers/edac/i7core_edac.c: fix error return code
Message-Id: <1344160356-387-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1344160356-387-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@redhat.com>
Cc: kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia@diku.dk>

From: Julia Lawall <julia@diku.dk>

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

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/edac/i7core_edac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 3672101..64dcc98 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -1177,7 +1177,7 @@ static int i7core_create_sysfs_devices(struct mem_ctl_info *mci)
 
 	pvt->addrmatch_dev = kzalloc(sizeof(*pvt->addrmatch_dev), GFP_KERNEL);
 	if (!pvt->addrmatch_dev)
-		return rc;
+		return -ENOMEM;
 
 	pvt->addrmatch_dev->type = &addrmatch_type;
 	pvt->addrmatch_dev->bus = mci->dev.bus;
@@ -1198,7 +1198,7 @@ static int i7core_create_sysfs_devices(struct mem_ctl_info *mci)
 		if (!pvt->chancounts_dev) {
 			put_device(pvt->addrmatch_dev);
 			device_del(pvt->addrmatch_dev);
-			return rc;
+			return -ENOMEM;
 		}
 
 		pvt->chancounts_dev->type = &all_channel_counts_type;

