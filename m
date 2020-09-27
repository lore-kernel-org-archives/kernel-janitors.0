From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 27 Sep 2020 19:12:13 +0000
Subject: [PATCH 03/18] [ARM] pata_icside: use semicolons rather than commas to separate statements
Message-Id: <1601233948-11629-4-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org

Replace commas with semicolons.  What is done is essentially described by
the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/ata/pata_icside.c |   21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/ata/pata_icside.c b/drivers/ata/pata_icside.c
index 08543aeb0093..498383cb6e29 100644
--- a/drivers/ata/pata_icside.c
+++ b/drivers/ata/pata_icside.c
@@ -202,14 +202,19 @@ static void pata_icside_set_dmamode(struct ata_port *ap, struct ata_device *adev
 	 * Choose the IOMD cycle timing which ensure that the interface
 	 * satisfies the measured active, recovery and cycle times.
 	 */
-	if (t.active <= 50 && t.recover <= 375 && t.cycle <= 425)
-		iomd_type = 'D', cycle = 187;
-	else if (t.active <= 125 && t.recover <= 375 && t.cycle <= 500)
-		iomd_type = 'C', cycle = 250;
-	else if (t.active <= 200 && t.recover <= 550 && t.cycle <= 750)
-		iomd_type = 'B', cycle = 437;
-	else
-		iomd_type = 'A', cycle = 562;
+	if (t.active <= 50 && t.recover <= 375 && t.cycle <= 425) {
+		iomd_type = 'D';
+		cycle = 187;
+	} else if (t.active <= 125 && t.recover <= 375 && t.cycle <= 500) {
+		iomd_type = 'C';
+		cycle = 250;
+	} else if (t.active <= 200 && t.recover <= 550 && t.cycle <= 750) {
+		iomd_type = 'B';
+		cycle = 437;
+	} else {
+		iomd_type = 'A';
+		cycle = 562;
+	}
 
 	ata_dev_info(adev, "timings: act %dns rec %dns cyc %dns (%c)\n",
 		     t.active, t.recover, t.cycle, iomd_type);
