From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Jul 2018 09:55:30 +0000
Subject: [PATCH] usb-misc: sisusbvga: remove redundant variable modey
Message-Id: <20180713095530.23720-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Winischhofer <thomas@winischhofer.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable modey is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'modey' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index f92c5df26320..3198d0477cf8 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -1750,7 +1750,7 @@ static int sisusb_setup_screen(struct sisusb_usb_data *sisusb,
 static int sisusb_set_default_mode(struct sisusb_usb_data *sisusb,
 		int touchengines)
 {
-	int ret = 0, i, j, modex, modey, bpp, du;
+	int ret = 0, i, j, modex, bpp, du;
 	u8 sr31, cr63, tmp8;
 	static const char attrdata[] = {
 		0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
@@ -1773,7 +1773,7 @@ static int sisusb_set_default_mode(struct sisusb_usb_data *sisusb,
 		0x00
 	};
 
-	modex = 640; modey = 480; bpp = 2;
+	modex = 640; bpp = 2;
 
 	GETIREG(SISSR, 0x31, &sr31);
 	GETIREG(SISCR, 0x63, &cr63);
-- 
2.17.1

