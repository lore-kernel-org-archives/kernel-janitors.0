From: Vasiliy Kulikov <segoon@openwall.com>
Date: Fri, 19 Nov 2010 18:41:58 +0000
Subject: [PATCH] power: power_supply_core: fix use after free and memory leak
Message-Id: <1290192119-11704-1-git-send-email-segoon@openwall.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org

device_unregister() might free its argument.  This leads to freed
memory use in kfree().  Also use put_device() instead of kfree()
as dev may be already used in another layer after call to device_add().

Signed-off-by: Vasiliy Kulikov <segoon@openwall.com>
---
 Compile tested only.

 drivers/power/power_supply_core.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/power/power_supply_core.c b/drivers/power/power_supply_core.c
index 91606bb..f06bad0 100644
--- a/drivers/power/power_supply_core.c
+++ b/drivers/power/power_supply_core.c
@@ -190,10 +190,10 @@ int power_supply_register(struct device *parent, struct power_supply *psy)
 	goto success;
 
 create_triggers_failed:
-	device_unregister(psy->dev);
+	device_del(dev);
 kobject_set_name_failed:
 device_add_failed:
-	kfree(dev);
+	put_device(dev);
 success:
 	return rc;
 }
-- 
1.7.0.4

