From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:29 +0000
Subject: [PATCH 7/15] media: pci: cx23885: don't export static symbol
Message-Id: <1426092997-30605-8-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@osg.samsung.com>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL;
@@

-EXPORT_SYMBOL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/pci/cx23885/altera-ci.c |    3 ---
 1 file changed, 3 deletions(-)

diff -u -p a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -483,7 +483,6 @@ static void altera_hw_filt_release(void
 	}
 
 }
-EXPORT_SYMBOL(altera_hw_filt_release);
 
 void altera_ci_release(void *dev, int ci_nr)
 {
@@ -598,7 +597,6 @@ static int altera_pid_feed_control(void
 
 	return 0;
 }
-EXPORT_SYMBOL(altera_pid_feed_control);
 
 static int altera_ci_start_feed(struct dvb_demux_feed *feed, int num)
 {
@@ -699,7 +697,6 @@ err:
 
 	return ret;
 }
-EXPORT_SYMBOL(altera_hw_filt_init);
 
 int altera_ci_init(struct altera_ci_config *config, int ci_nr)
 {

