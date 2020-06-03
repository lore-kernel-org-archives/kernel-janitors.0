From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 13:51:02 +0000
Subject: [PATCH] input: ims-pcu: remove redundant assignment to variable 'error'
Message-Id: <20200603135102.130436-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable error is being initialized with a value that is
never read and the -ENOMEM error return is being returned anyhow
by the error exit path to label err_free_mem.  The assignment is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/input/misc/ims-pcu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
index d8dbfc030d0f..4ba68aa3d281 100644
--- a/drivers/input/misc/ims-pcu.c
+++ b/drivers/input/misc/ims-pcu.c
@@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
 	if (!gamepad || !input) {
 		dev_err(pcu->dev,
 			"Not enough memory for gamepad device\n");
-		error = -ENOMEM;
 		goto err_free_mem;
 	}
 
-- 
2.25.1
