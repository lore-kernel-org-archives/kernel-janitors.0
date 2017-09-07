From: Colin King <colin.king@canonical.com>
Date: Thu, 07 Sep 2017 09:50:23 +0000
Subject: [PATCH] media: cx23885: make const array buf static, reduces object code size
Message-Id: <20170907095023.26948-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Schwarzott <zzam@gentoo.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array buf on the stack, instead make it static.
Makes the object code smaller by over 240 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  21689	  22992	    416	  45097	   b029	cx23885-cards.o

After:
   text	   data	    bss	    dec	    hex	filename
  21348	  23088	    416	  44852	   af34	cx23885-cards.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/cx23885/cx23885-cards.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/cx23885-cards.c b/drivers/media/pci/cx23885/cx23885-cards.c
index 78a8836d03e4..28eab9c518c5 100644
--- a/drivers/media/pci/cx23885/cx23885-cards.c
+++ b/drivers/media/pci/cx23885/cx23885-cards.c
@@ -1323,7 +1323,7 @@ static void hauppauge_eeprom(struct cx23885_dev *dev, u8 *eeprom_data)
 static void tbs_card_init(struct cx23885_dev *dev)
 {
 	int i;
-	const u8 buf[] = {
+	static const u8 buf[] = {
 		0xe0, 0x06, 0x66, 0x33, 0x65,
 		0x01, 0x17, 0x06, 0xde};
 
-- 
2.14.1

