From: Colin King <colin.king@canonical.com>
Date: Wed, 31 Jul 2019 09:47:36 +0000
Subject: [PATCH] staging: rtl8188eu: remove redundant assignment to variable rtstatus
Message-Id: <20190731094736.28637-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Larry Finger <Larry.Finger@lwfinger.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable rtstatus is being initialized with a value that is never read
and rtstatus is being re-assigned a little later on. The assignment is
redundant and hence can be removed.  Also, make rtstatus a bool to
match the function return type.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/hal/bb_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/hal/bb_cfg.c b/drivers/staging/rtl8188eu/hal/bb_cfg.c
index 11e0bb9c67d7..51882858fcf0 100644
--- a/drivers/staging/rtl8188eu/hal/bb_cfg.c
+++ b/drivers/staging/rtl8188eu/hal/bb_cfg.c
@@ -653,7 +653,7 @@ static bool config_parafile(struct adapter *adapt)
 
 bool rtl88eu_phy_bb_config(struct adapter *adapt)
 {
-	int rtstatus = true;
+	bool rtstatus;
 	u32 regval;
 	u8 crystal_cap;
 
-- 
2.20.1
