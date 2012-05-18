From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2012 07:36:47 +0000
Subject: [patch] NFC: potential integer overflow problem in check_crc()
Message-Id: <20120518073647.GB4136@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>, Samuel Ortiz <sameo@linux.intel.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

If "buf[0]" is 255 then "len" gets set to 0.  The call to
"crc_ccitt(0xffff, buf, len - 2);" casts the "len - 2" to a high
positive number which is ugly.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/nfc/pn544_hci.c b/drivers/nfc/pn544_hci.c
index 46f4a9f..281f18c 100644
--- a/drivers/nfc/pn544_hci.c
+++ b/drivers/nfc/pn544_hci.c
@@ -232,7 +232,7 @@ static int pn544_hci_i2c_write(struct i2c_client *client, u8 *buf, int len)
 
 static int check_crc(u8 *buf, int buflen)
 {
-	u8 len;
+	int len;
 	u16 crc;
 
 	len = buf[0] + 1;
