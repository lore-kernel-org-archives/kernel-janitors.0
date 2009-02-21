From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 21 Feb 2009 22:43:11 +0000
Subject: [PATCH] aty128fb: remove unused variable 'pwr_command'
Message-Id: <20090221224252.5684.79344.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this warning:
  drivers/video/aty/aty128fb.c:2368: warning: unused variable 'pwr_command'

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/video/aty/aty128fb.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/video/aty/aty128fb.c b/drivers/video/aty/aty128fb.c
index ea5b193..e912258 100644
--- a/drivers/video/aty/aty128fb.c
+++ b/drivers/video/aty/aty128fb.c
@@ -2365,7 +2365,6 @@ static void fbcon_aty128_bmove(struct display *p, int sy, int sx, int dy, int dx
 static void aty128_set_suspend(struct aty128fb_par *par, int suspend)
 {
 	u32	pmgt;
-	u16	pwr_command;
 	struct pci_dev *pdev = par->pdev;
 
 	if (!par->pm_reg)

