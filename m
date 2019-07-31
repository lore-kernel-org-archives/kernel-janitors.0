From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 08:42:10 +0000
Subject: [PATCH] media: pulse8-cec: remove redundant assignment to variable err
Message-Id: <20190731084210.24911-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable err is being initialized with a value that is never read
and err is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/usb/pulse8-cec/pulse8-cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/pulse8-cec/pulse8-cec.c b/drivers/media/usb/pulse8-cec/pulse8-cec.c
index ac88ade94cda..85fc11829758 100644
--- a/drivers/media/usb/pulse8-cec/pulse8-cec.c
+++ b/drivers/media/usb/pulse8-cec/pulse8-cec.c
@@ -640,7 +640,7 @@ static int pulse8_connect(struct serio *serio, struct serio_driver *drv)
 {
 	u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_PHYS_ADDR | CEC_CAP_MONITOR_ALL;
 	struct pulse8 *pulse8;
-	int err = -ENOMEM;
+	int err;
 	struct cec_log_addrs log_addrs = {};
 	u16 pa = CEC_PHYS_ADDR_INVALID;
 
-- 
2.20.1
