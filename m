From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 17:11:45 +0000
Subject: [PATCH][next] staging: vt6655: remove redundant assignment to variable ret
Message-Id: <20200114171145.375356-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Forest Bond <forest@alittletooquiet.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable ret is being initialized with a value that
is never read and is being re-assigned later on. The
assignment is redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/vt6655/rf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index fb2855e686a7..d6ca6e5551a7 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -758,7 +758,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
  */
 bool RFbSetPower(struct vnt_private *priv, unsigned int rate, u16 uCH)
 {
-	bool ret = true;
+	bool ret;
 	unsigned char byPwr = 0;
 	unsigned char byDec = 0;
 
-- 
2.24.0
