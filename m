From: Julia Lawall <julia@diku.dk>
Date: Mon, 22 Aug 2011 11:46:34 +0000
Subject: [PATCH] arch/s390/kernel/ipl.c: correct error detection check
Message-Id: <1314013594-25651-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: kernel-janitors@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, linux390@de.ibm.com, Michael Holzheu <holzheu@linux.vnet.ibm.com>, linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org, sumsaha@gmail.com

From: Julia Lawall <julia@diku.dk>

reipl_fcp_kset was just initialized, so it appears that it should be tested
instead of reipl_kset.

Signed-off-by: Julia Lawall <julia@diku.dk>
Reported-by: Suman Saha <sumsaha@gmail.com>

---
 arch/s390/kernel/ipl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/ipl.c b/arch/s390/kernel/ipl.c
index 04361d5..ee28e06 100644
--- a/arch/s390/kernel/ipl.c
+++ b/arch/s390/kernel/ipl.c
@@ -1220,7 +1220,7 @@ static int __init reipl_fcp_init(void)
 	/* sysfs: create fcp kset for mixing attr group and bin attrs */
 	reipl_fcp_kset = kset_create_and_add(IPL_FCP_STR, NULL,
 					     &reipl_kset->kobj);
-	if (!reipl_kset) {
+	if (!reipl_fcp_kset) {
 		free_page((unsigned long) reipl_block_fcp);
 		return -ENOMEM;
 	}

