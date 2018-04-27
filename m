From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 19:12:31 +0000
Subject: [PATCH] usb-misc: sisusbvga: fix spelling mistake: "asymmeric" -> "asymmetric"
Message-Id: <20180427191231.17305-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Winischhofer <thomas@winischhofer.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in text string

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/usb/misc/sisusbvga/sisusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index 3e65bdc2615c..f92c5df26320 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -2107,7 +2107,7 @@ static void sisusb_get_ramconfig(struct sisusb_usb_data *sisusb)
 		bw = busSDR[(tmp8 & 0x03)];
 		break;
 	case 2:
-		ramtypetext1 = "asymmeric";
+		ramtypetext1 = "asymmetric";
 		sisusb->vramsize += sisusb->vramsize/2;
 		bw = busDDRA[(tmp8 & 0x03)];
 		break;
-- 
2.17.0

