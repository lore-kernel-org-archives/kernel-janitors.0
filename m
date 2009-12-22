From: peterhuewe@gmx.de
Date: Tue, 22 Dec 2009 08:27:05 +0000
Subject: [PATCH 1/6] uwb/i1480: add __init/__exit macros
Message-Id: <1261470431-23642-1-git-send-email-peterhuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Peter Huewe <peterhuewe@gmx.de>, linux-kernel@vger.kernel.org

From: Peter Huewe <peterhuewe@gmx.de>

Trivial patch which adds the __init/__exit macros to the module_init/
module_exit functions of

uwb/i1480/i1480-est.c

@Jiri: As there is no maintainer, it seems it is up to you to decide :)

Patch against linux-next-tree, 22. Dez 08:38:18 CET 2009
but also present in linus tree.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
---
 drivers/uwb/i1480/i1480-est.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/uwb/i1480/i1480-est.c b/drivers/uwb/i1480/i1480-est.c
index 7bf8c6f..f2eb4d8 100644
--- a/drivers/uwb/i1480/i1480-est.c
+++ b/drivers/uwb/i1480/i1480-est.c
@@ -54,7 +54,7 @@ static struct uwb_est_entry i1480_est_fd01[] = {
 		.size = sizeof(struct i1480_rceb) + 2 },
 };
 
-static int i1480_est_init(void)
+static int __init i1480_est_init(void)
 {
 	int result = uwb_est_register(i1480_CET_VS1, 0x00, 0x8086, 0x0c3b,
 				      i1480_est_fd00,
@@ -73,7 +73,7 @@ static int i1480_est_init(void)
 }
 module_init(i1480_est_init);
 
-static void i1480_est_exit(void)
+static void __exit i1480_est_exit(void)
 {
 	uwb_est_unregister(i1480_CET_VS1, 0x00, 0x8086, 0x0c3b,
 			   i1480_est_fd00, ARRAY_SIZE(i1480_est_fd00));
-- 
1.6.4.4

