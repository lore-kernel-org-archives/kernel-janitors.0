From: Colin King <colin.king@canonical.com>
Date: Tue, 27 Nov 2018 14:27:15 +0000
Subject: [PATCH] staging: rtlwifi: fix spelling mistake "disnabled" -> "disabled"
Message-Id: <20181127142715.27406-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an ODM_RT_TRACE message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/phydm/phydm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm.c b/drivers/staging/rtlwifi/phydm/phydm.c
index 27635feedba2..52b85b3ddb34 100644
--- a/drivers/staging/rtlwifi/phydm/phydm.c
+++ b/drivers/staging/rtlwifi/phydm/phydm.c
@@ -477,7 +477,7 @@ static void phydm_supportability_init(void *dm_void)
 
 	} else {
 		ODM_RT_TRACE(dm, ODM_COMP_INIT,
-			     "ODM adaptivity is set to disnabled!!!\n");
+			     "ODM adaptivity is set to disabled!!!\n");
 		/**/
 	}
 
-- 
2.19.1
