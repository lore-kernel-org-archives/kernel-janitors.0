From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 22 Nov 2014 14:39:15 +0000
Subject: [PATCH 2/6] i7core_edac: fix error return code
Message-Id: <1416667159-9808-3-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416667159-9808-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>
Cc: kernel-janitors@vger.kernel.org, Doug Thompson <dougthompson@xmission.com>, Borislav Petkov <bp@alien8.de>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

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
 drivers/edac/i7core_edac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index 9cd0b30..5da90de 100644
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

