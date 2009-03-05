From: Hannes Eder <hannes@hanneseder.net>
Date: Thu, 05 Mar 2009 19:15:01 +0000
Subject: [PATCH v2 06/15] NULL noise: drivers/mtd/tests/mtd_*test.c
Message-Id: <20090305191457.30062.43881.stgit@f10box.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
In-Reply-To: <20090305190954.30062.44759.stgit@f10box.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: trivial@kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warnings:
  drivers/mtd/tests/mtd_oobtest.c:139:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:192:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:219:41: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:284:25: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:525:25: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:545:25: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:569:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:589:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:613:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:633:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:673:41: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_oobtest.c:701:33: warning: Using plain integer as NULL pointer
  drivers/mtd/tests/mtd_readtest.c:74:41: warning: Using plain integer as NULL pointer

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
---
v2: other subject, as suggested by Al Viro

 drivers/mtd/tests/mtd_oobtest.c  |   24 ++++++++++++------------
 drivers/mtd/tests/mtd_readtest.c |    2 +-
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/tests/mtd_oobtest.c b/drivers/mtd/tests/mtd_oobtest.c
index afbc3f8..a18e8d2 100644
--- a/drivers/mtd/tests/mtd_oobtest.c
+++ b/drivers/mtd/tests/mtd_oobtest.c
@@ -136,7 +136,7 @@ static int write_eraseblock(int ebnum)
 		ops.ooblen    = use_len;
 		ops.oobretlen = 0;
 		ops.ooboffs   = use_offset;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
 		err = mtd->write_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
@@ -189,7 +189,7 @@ static int verify_eraseblock(int ebnum)
 		ops.ooblen    = use_len;
 		ops.oobretlen = 0;
 		ops.ooboffs   = use_offset;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		err = mtd->read_oob(mtd, addr, &ops);
 		if (err || ops.oobretlen != use_len) {
@@ -216,7 +216,7 @@ static int verify_eraseblock(int ebnum)
 			ops.ooblen    = mtd->ecclayout->oobavail;
 			ops.oobretlen = 0;
 			ops.ooboffs   = 0;
-			ops.datbuf    = 0;
+			ops.datbuf    = NULL;
 			ops.oobbuf    = readbuf;
 			err = mtd->read_oob(mtd, addr, &ops);
 			if (err || ops.oobretlen != mtd->ecclayout->oobavail) {
@@ -281,7 +281,7 @@ static int verify_eraseblock_in_one_go(int ebnum)
 	ops.ooblen    = len;
 	ops.oobretlen = 0;
 	ops.ooboffs   = 0;
-	ops.datbuf    = 0;
+	ops.datbuf    = NULL;
 	ops.oobbuf    = readbuf;
 	err = mtd->read_oob(mtd, addr, &ops);
 	if (err || ops.oobretlen != len) {
@@ -522,7 +522,7 @@ static int __init mtd_oobtest_init(void)
 	ops.ooblen    = 1;
 	ops.oobretlen = 0;
 	ops.ooboffs   = mtd->ecclayout->oobavail;
-	ops.datbuf    = 0;
+	ops.datbuf    = NULL;
 	ops.oobbuf    = writebuf;
 	printk(PRINT_PREF "attempting to start write past end of OOB\n");
 	printk(PRINT_PREF "an error is expected...\n");
@@ -542,7 +542,7 @@ static int __init mtd_oobtest_init(void)
 	ops.ooblen    = 1;
 	ops.oobretlen = 0;
 	ops.ooboffs   = mtd->ecclayout->oobavail;
-	ops.datbuf    = 0;
+	ops.datbuf    = NULL;
 	ops.oobbuf    = readbuf;
 	printk(PRINT_PREF "attempting to start read past end of OOB\n");
 	printk(PRINT_PREF "an error is expected...\n");
@@ -566,7 +566,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooblen    = mtd->ecclayout->oobavail + 1;
 		ops.oobretlen = 0;
 		ops.ooboffs   = 0;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
 		printk(PRINT_PREF "attempting to write past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
@@ -586,7 +586,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooblen    = mtd->ecclayout->oobavail + 1;
 		ops.oobretlen = 0;
 		ops.ooboffs   = 0;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		printk(PRINT_PREF "attempting to read past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
@@ -610,7 +610,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooblen    = mtd->ecclayout->oobavail;
 		ops.oobretlen = 0;
 		ops.ooboffs   = 1;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = writebuf;
 		printk(PRINT_PREF "attempting to write past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
@@ -630,7 +630,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooblen    = mtd->ecclayout->oobavail;
 		ops.oobretlen = 0;
 		ops.ooboffs   = 1;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		printk(PRINT_PREF "attempting to read past end of device\n");
 		printk(PRINT_PREF "an error is expected...\n");
@@ -670,7 +670,7 @@ static int __init mtd_oobtest_init(void)
 			ops.ooblen    = sz;
 			ops.oobretlen = 0;
 			ops.ooboffs   = 0;
-			ops.datbuf    = 0;
+			ops.datbuf    = NULL;
 			ops.oobbuf    = writebuf;
 			err = mtd->write_oob(mtd, addr, &ops);
 			if (err)
@@ -698,7 +698,7 @@ static int __init mtd_oobtest_init(void)
 		ops.ooblen    = mtd->ecclayout->oobavail * 2;
 		ops.oobretlen = 0;
 		ops.ooboffs   = 0;
-		ops.datbuf    = 0;
+		ops.datbuf    = NULL;
 		ops.oobbuf    = readbuf;
 		err = mtd->read_oob(mtd, addr, &ops);
 		if (err)
diff --git a/drivers/mtd/tests/mtd_readtest.c b/drivers/mtd/tests/mtd_readtest.c
index 645e77f..79fc453 100644
--- a/drivers/mtd/tests/mtd_readtest.c
+++ b/drivers/mtd/tests/mtd_readtest.c
@@ -71,7 +71,7 @@ static int read_eraseblock_by_page(int ebnum)
 			ops.ooblen    = mtd->oobsize;
 			ops.oobretlen = 0;
 			ops.ooboffs   = 0;
-			ops.datbuf    = 0;
+			ops.datbuf    = NULL;
 			ops.oobbuf    = oobbuf;
 			ret = mtd->read_oob(mtd, addr, &ops);
 			if (ret || ops.oobretlen != mtd->oobsize) {

