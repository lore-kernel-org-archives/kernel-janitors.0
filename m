From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Sep 2020 09:02:38 +0000
Subject: [PATCH] staging: vchiq: silence an uninitialized variable warning
Message-Id: <20200930090238.GA621698@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: devel@driverdev.osuosl.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Marcelo Diop-Gonzalez <marcgonzalez@google.com>, kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, Jamal Shareef <jamal.k.shareef@gmail.com>, linux-arm-kernel@lists.infradead.org

Smatch complains that "userdata" can be passed to vchiq_bulk_transfer()
without being initialized.  Smatch is correct, however, in that
situation the "userdata" is not used so it doesn't cause a problem.
Passing an uninitialized variable will trigger a UBSan warning at
runtime so this warning is worth silencing by setting "userdata" to
NULL.

Fixes: a4367cd2b231 ("staging: vchiq: convert compat bulk transfer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 590415561b73..71b962777da5 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -952,7 +952,7 @@ static int vchiq_irq_queue_bulk_tx_rx(struct vchiq_instance *instance,
 {
 	struct vchiq_service *service;
 	struct bulk_waiter_node *waiter = NULL;
-	void *userdata;
+	void *userdata = NULL;
 	int status = 0;
 	int ret;
 
-- 
2.28.0
