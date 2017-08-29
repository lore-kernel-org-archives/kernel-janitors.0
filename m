From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 29 Aug 2017 19:23:49 +0000
Subject: [PATCH] driver core: bus: Fix a potential double free
Message-Id: <20170829192349.15666-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The .release function of driver_ktype is 'driver_release()'.
This function frees the container_of this kobject.

So, this memory must not be freed explicitly in the error handling path of
'bus_add_driver()'. Otherwise a double free will occur.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
I have left the 'drv->p = NULL' even if it looks useless to me. It does not
hurt. I have also left a comment to explain why we do not free 'drv->p'
explicitly before zeroing this pointer.
---
 drivers/base/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index e162c9a789ba..22a64fd3309b 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -698,7 +698,7 @@ int bus_add_driver(struct device_driver *drv)
 
 out_unregister:
 	kobject_put(&priv->kobj);
-	kfree(drv->p);
+	/* drv->p is freed in driver_release()  */
 	drv->p = NULL;
 out_put_bus:
 	bus_put(bus);
-- 
2.11.0

