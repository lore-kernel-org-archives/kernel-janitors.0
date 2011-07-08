From: Dan Carpenter <error27@gmail.com>
Date: Fri, 08 Jul 2011 07:22:33 +0000
Subject: [PATCH] Staging: gma500: typo in array initialization
Message-Id: <20110708072233.GS18655@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a comma missing here between the strings so they were
concatonated by mistake.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/gma500/mdfld_dsi_pkg_sender.c b/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
index 9198aa8..9b543eb 100644
--- a/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
+++ b/drivers/staging/gma500/mdfld_dsi_pkg_sender.c
@@ -62,7 +62,7 @@ static const char * const dsi_errors[] = {
 	"RX Prot Violation",
 	"HS Generic Write FIFO Full",
 	"LP Generic Write FIFO Full",
-	"Generic Read Data Avail"
+	"Generic Read Data Avail",
 	"Special Packet Sent",
 	"Tearing Effect",
 };
