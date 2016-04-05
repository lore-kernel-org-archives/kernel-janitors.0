From: Clifton Barnes <clifton.a.barnes@gmail.com>
Date: Tue, 05 Apr 2016 21:37:37 +0000
Subject: [PATCH 1/2] staging: slicoss: fix bare use of 'unsigned'
Message-Id: <1459892258-18789-1-git-send-email-clifton.a.barnes@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: liodot@gmail.com, charrer@alacritech.com
Cc: kernel-janitors@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, Clifton Barnes <clifton.a.barnes@gmail.com>

fix checkpatch.pl warning about 'Prefer 'unsigned int' to bare use of
'unsigned''

Signed-off-by: Clifton Barnes <clifton.a.barnes@gmail.com>
---
 drivers/staging/slicoss/slicoss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/slicoss/slicoss.c b/drivers/staging/slicoss/slicoss.c
index fa61e8e..cb1ad76 100644
--- a/drivers/staging/slicoss/slicoss.c
+++ b/drivers/staging/slicoss/slicoss.c
@@ -1144,7 +1144,7 @@ static int slic_config_get(struct adapter *adapter, u32 config, u32 config_h)
 /*
  * Compute a checksum of the EEPROM according to RFC 1071.
  */
-static u16 slic_eeprom_cksum(void *eeprom, unsigned len)
+static u16 slic_eeprom_cksum(void *eeprom, unsigned int len)
 {
 	u16 *wp = eeprom;
 	u32 checksum = 0;
-- 
1.9.1

