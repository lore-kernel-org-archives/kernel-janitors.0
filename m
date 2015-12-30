From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 30 Dec 2015 10:58:43 +0000
Subject: [PATCH] Staging: ste_rmi4: constify synaptics_rmi4_platform_data structures
Message-Id: <1451473123-29042-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This synaptics_rmi4_platform_data structure is never modified, so declare
it as const.  Others are already const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c b/drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c
index 824d460..bbec0276 100644
--- a/drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c
+++ b/drivers/staging/ste_rmi4/synaptics_i2c_rmi4.c
@@ -870,7 +870,7 @@ static int synaptics_rmi4_i2c_query_device(struct synaptics_rmi4_data *pdata)
  * Descriptor structure.
  * Describes the number of i2c devices on the bus that speak RMI.
  */
-static struct synaptics_rmi4_platform_data synaptics_rmi4_platformdata = {
+static const struct synaptics_rmi4_platform_data synaptics_rmi4_platformdata = {
 	.irq_type       = (IRQF_TRIGGER_FALLING | IRQF_SHARED),
 	.x_flip		= false,
 	.y_flip		= true,

