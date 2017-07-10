From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Jul 2017 18:51:03 +0000
Subject: [PATCH] [media] solo6x10: make const array saa7128_regs_ntsc static
Message-Id: <20170710185103.18461-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bluecherry Maintainers <maintainers@bluecherrydvr.com>, Anton Sviridenko <anton@corp.bluecherry.net>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>, Ismael Luceno <ismael@iodev.co.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate const array saa7128_regs_ntsc on the stack but insteaed make
it static.  Makes the object code smaller and saves nearly 840 bytes

Before:
   text	   data	    bss	    dec	    hex	filename
   9218	    360	      0	   9578	   256a	solo6x10-tw28.o

After:
   text	   data	    bss	    dec	    hex	filename
   8237	    504	      0	   8741	   2225	solo6x10-tw28.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/solo6x10/solo6x10-tw28.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.c b/drivers/media/pci/solo6x10/solo6x10-tw28.c
index 0632d3f7c73c..1c013a03d851 100644
--- a/drivers/media/pci/solo6x10/solo6x10-tw28.c
+++ b/drivers/media/pci/solo6x10/solo6x10-tw28.c
@@ -532,7 +532,7 @@ static void saa712x_write_regs(struct solo_dev *dev, const u8 *vals,
 static void saa712x_setup(struct solo_dev *dev)
 {
 	const int reg_start = 0x26;
-	const u8 saa7128_regs_ntsc[] = {
+	static const u8 saa7128_regs_ntsc[] = {
 	/* :0x26 */
 		0x0d, 0x00,
 	/* :0x28 */
-- 
2.11.0

