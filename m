From: Colin King <colin.king@canonical.com>
Date: Sat, 03 Nov 2018 16:03:11 +0000
Subject: [PATCH] fs/coda: clean up indentation, replace spaces with tab
Message-Id: <20181103160311.3289-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, codalist@coda.cs.cmu.edu
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation, replace spaces with tab

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/coda/psdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/coda/psdev.c b/fs/coda/psdev.c
index c5234c21b539..1bc78463c346 100644
--- a/fs/coda/psdev.c
+++ b/fs/coda/psdev.c
@@ -358,7 +358,7 @@ static int init_coda_psdev(void)
 	if (register_chrdev(CODA_PSDEV_MAJOR, "coda", &coda_psdev_fops)) {
 		pr_err("%s: unable to get major %d\n",
 		       __func__, CODA_PSDEV_MAJOR);
-              return -EIO;
+		return -EIO;
 	}
 	coda_psdev_class = class_create(THIS_MODULE, "coda");
 	if (IS_ERR(coda_psdev_class)) {
-- 
2.19.1
