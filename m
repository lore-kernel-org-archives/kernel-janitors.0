From: Colin King <colin.king@canonical.com>
Date: Fri, 10 Apr 2020 11:39:13 +0000
Subject: [PATCH] media: mantis: remove redundant assignment to variable err
Message-Id: <20200410113913.14430-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/mantis/hopper_vp3028.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/mantis/hopper_vp3028.c b/drivers/media/pci/mantis/hopper_vp3028.c
index 37bd386f3ed8..ce1e8737b14b 100644
--- a/drivers/media/pci/mantis/hopper_vp3028.c
+++ b/drivers/media/pci/mantis/hopper_vp3028.c
@@ -33,7 +33,7 @@ static int vp3028_frontend_init(struct mantis_pci *mantis, struct dvb_frontend *
 {
 	struct i2c_adapter *adapter	= &mantis->adapter;
 	struct mantis_hwconfig *config	= mantis->hwconfig;
-	int err = 0;
+	int err;
 
 	mantis_gpio_set_bits(mantis, config->reset, 0);
 	msleep(100);
-- 
2.25.1
