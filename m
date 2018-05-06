From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 06 May 2018 08:33:14 +0000
Subject: [PATCH v2] [media] pvrusb2: delete unneeded include
Message-Id: <alpine.DEB.2.20.1805061032120.3435@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Isely <isely@pobox.com>
Cc: kernel-janitors@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

pvrusb2-video-v4l.h only declares pvr2_saa7115_subdev_update and
includes pvrusb2-hdw-internal.h.  pvrusb2-cx2584x-v4l.c does not
use pvr2_saa7115_subdev_update and it explicitly includes
pvrusb2-hdw-internal.h.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---

v2: Make the subject line a bit less generic

 drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
index 242b213..d5bec0f 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-cx2584x-v4l.c
@@ -23,7 +23,6 @@
 */

 #include "pvrusb2-cx2584x-v4l.h"
-#include "pvrusb2-video-v4l.h"


 #include "pvrusb2-hdw-internal.h"

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
