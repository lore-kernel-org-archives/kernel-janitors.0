From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Sep 2018 08:32:08 +0000
Subject: [PATCH] Bluetooth: btrtl: Make array extension_sig static, shrinks object size
Message-Id: <20180926083208.13632-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180904160110.27837-1-colin.king@canonical.com>
In-Reply-To: <20180904160110.27837-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array extension_sig on the stack but instead make it
static. Makes the object code smaller by 75 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  14325	   4920	      0	  19245	   4b2d	drivers/bluetooth/btrtl.o

After:
   text	   data	    bss	    dec	    hex	filename
  14186	   4984	      0	  19170	   4ae2	drivers/bluetooth/btrtl.o

(gcc version 8.2.0 x86_64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/bluetooth/btrtl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index 7f9ea8e4c1b2..52a9a55057c0 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -206,7 +206,7 @@ static int rtlbt_parse_firmware(struct hci_dev *hdev,
 				struct btrtl_device_info *btrtl_dev,
 				unsigned char **_buf)
 {
-	const u8 extension_sig[] = { 0x51, 0x04, 0xfd, 0x77 };
+	static const u8 extension_sig[] = { 0x51, 0x04, 0xfd, 0x77 };
 	struct rtl_epatch_header *epatch_info;
 	unsigned char *buf;
 	int i, len;
-- 
2.17.1
