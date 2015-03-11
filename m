From: Quentin Lambert <lambert.quentin@gmail.com>
Date: Wed, 11 Mar 2015 14:03:44 +0000
Subject: [PATCH 1/3] Staging: dgnc: dgnc_driver: Add a missing call to dgnc_tty_uninit
Message-Id: <20150311140344.GA17038@sloth>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lidza Louina <lidza.louina@gmail.com>, Mark Hounschell <markh@compro.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, driverdev-devel@linuxdriverproject.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

This function is called on the previous and the next failure branches.
This patch adds the call on the branch where it seems to be missing.

Signed-off-by: Quentin Lambert <lambert.quentin@gmail.com>
---
 drivers/staging/dgnc/dgnc_driver.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/dgnc/dgnc_driver.c b/drivers/staging/dgnc/dgnc_driver.c
index fa1ee79..b7fd2bf 100644
--- a/drivers/staging/dgnc/dgnc_driver.c
+++ b/drivers/staging/dgnc/dgnc_driver.c
@@ -581,6 +581,7 @@ static int dgnc_found_board(struct pci_dev *pdev, int id)
 
 	rc = dgnc_finalize_board_init(brd);
 	if (rc < 0) {
+		dgnc_tty_uninit(brd);
 		pr_err(DRVSTR ": Can't finalize board init (%d)\n", rc);
 		brd->state = BOARD_FAILED;
 		brd->dpastatus = BD_NOFEP;
-- 
1.9.1

