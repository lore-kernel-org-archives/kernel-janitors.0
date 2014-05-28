From: Emil Goode <emilgoode@gmail.com>
Date: Wed, 28 May 2014 13:33:50 +0000
Subject: [PATCH] mfd: fix unintentional NULL check in menelaus_set_voltage()
Message-Id: <1401284030-9650-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Jingoo Han <jg1.han@samsung.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

The struct menelaus_vtg pointer vtg cannot be NULL here
so the condition is never true and if it ever was true
it would lead to a NULL pointer dereference when we goto
label set_voltage.

Before the below patch was applied the code was:

if (vtg = 0)

The intention was to check if vtg_val is 0.

commit 59a9f7a32adf6537b4e4db8ca204eeb77d7a634e
("mfd: menelaus: Use NULL instead of 0")

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
Hello,

This is only build tested, it would be good to get a comment
from someone who is familiar with this code.

Found using coccinelle.

Best regards,

Emil Goode

 drivers/mfd/menelaus.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/menelaus.c b/drivers/mfd/menelaus.c
index ad25bfa..4859597 100644
--- a/drivers/mfd/menelaus.c
+++ b/drivers/mfd/menelaus.c
@@ -466,7 +466,7 @@ static int menelaus_set_voltage(const struct menelaus_vtg *vtg, int mV,
 	struct i2c_client *c = the_menelaus->client;
 
 	mutex_lock(&the_menelaus->lock);
-	if (!vtg)
+	if (vtg_val = 0)
 		goto set_voltage;
 
 	ret = menelaus_read_reg(vtg->vtg_reg);
-- 
1.7.10.4

