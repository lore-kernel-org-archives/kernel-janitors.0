From: Julia Lawall <julia@diku.dk>
Date: Thu, 30 Jul 2009 14:11:24 +0000
Subject: [PATCH 5/5] sound/aoa: Add kmalloc NULL tests
Message-Id: <Pine.LNX.4.64.0907301610550.8734@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johannes@sipsolutions.net, linuxppc-dev@ozlabs.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Check that the result of kzalloc is not NULL before a dereference.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression *x;
identifier f;
constant char *C;
@@

x = \(kmalloc\|kcalloc\|kzalloc\)(...);
... when != x = NULL
    when != x != NULL
    when != (x || ...)
(
kfree(x)
|
f(...,C,...,x,...)
|
*f(...,x,...)
|
*x->f
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 sound/aoa/core/gpio-pmf.c           |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/sound/aoa/core/gpio-pmf.c b/sound/aoa/core/gpio-pmf.c
index 5ca2220..b4439ce 100644
--- a/sound/aoa/core/gpio-pmf.c
+++ b/sound/aoa/core/gpio-pmf.c
@@ -182,6 +182,12 @@ static int pmf_set_notify(struct gpio_runtime *rt,
 	if (!old && notify) {
 		irq_client = kzalloc(sizeof(struct pmf_irq_client),
 				     GFP_KERNEL);
+		if (!irq_client) {
+			err = -ENOMEM;
+			printk(KERN_ERR "snd-aoa: gpio layer failed to"
+				" register %s irq (%d)\n", name, err);
+			goto out_unlock;
+		}
 		irq_client->data = notif;
 		irq_client->handler = pmf_handle_notify_irq;
 		irq_client->owner = THIS_MODULE;
