From: Colin King <colin.king@canonical.com>
Date: Fri, 23 Mar 2018 17:36:06 +0000
Subject: [PATCH][next] staging: r8822be: fix type in guard macro __PHYDMKFREE_H__
Message-Id: <20180323173606.21119-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Ping-Ke Shih <pkshih@realtek.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The #define for __PHYDMKFREE_H__ is missing a character and is not
the same as the guard check.  Defined this correctly.

Cleans up clang warning:
warning: '__PHYDMKFREE_H__' is used as a header guard here, followed
by #define of a different macro [-Wheader-guard]

Fixes: 9ce99b04b5b8 ("staging: r8822be: Add phydm mini driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtlwifi/phydm/phydm_kfree.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtlwifi/phydm/phydm_kfree.h b/drivers/staging/rtlwifi/phydm/phydm_kfree.h
index 1ee60059afc1..2c6b0a48e76e 100644
--- a/drivers/staging/rtlwifi/phydm/phydm_kfree.h
+++ b/drivers/staging/rtlwifi/phydm/phydm_kfree.h
@@ -24,7 +24,7 @@
  *****************************************************************************/
 
 #ifndef __PHYDMKFREE_H__
-#define __PHYDKFREE_H__
+#define __PHYDKKFREE_H__
 
 #define KFREE_VERSION "1.0"
 
-- 
2.15.1

