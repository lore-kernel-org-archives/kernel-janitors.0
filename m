From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jun 2014 07:20:25 +0000
Subject: [patch] gma500: out of bounds read in debug code comma
Message-Id: <20140612072025.GA17733@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The code assume that this array has 32 elements but because of a missing
comma, then it only has 31.  This array is only used when error occurs
and debugging is enabled so it's not very serious.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c b/drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
index 489ffd2..a3d37e4 100644
--- a/drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
+++ b/drivers/gpu/drm/gma500/mdfld_dsi_pkg_sender.c
@@ -85,7 +85,7 @@ static const char *const dsi_errors[] = {
 	"RX Prot Violation",
 	"HS Generic Write FIFO Full",
 	"LP Generic Write FIFO Full",
-	"Generic Read Data Avail"
+	"Generic Read Data Avail",
 	"Special Packet Sent",
 	"Tearing Effect",
 };
