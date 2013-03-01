From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Mar 2013 20:26:41 +0000
Subject: [patch] dm-cache-target: check for allocation failure
Message-Id: <20130301202641.GA22066@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>
Cc: dm-devel@redhat.com, Neil Brown <neilb@suse.de>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

The allocation here isn't checked.  I changed it to using kcalloc()
as a cleanup.  It adds integer overflow checking as well which makes
the code easier to audit.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I expect that kbuild will complain about this soon?

diff --git a/drivers/md/dm-cache-target.c b/drivers/md/dm-cache-target.c
index 908d554..40753b4 100644
--- a/drivers/md/dm-cache-target.c
+++ b/drivers/md/dm-cache-target.c
@@ -1957,8 +1957,11 @@ bad:
 static int copy_ctr_args(struct cache *cache, int argc, const char **argv)
 {
 	unsigned i;
-	const char **copy = kzalloc(sizeof(*copy) * argc, GFP_KERNEL);
+	const char **copy;
 
+	copy = kcalloc(argc, sizeof(*copy), GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
 	for (i = 0; i < argc; i++) {
 		copy[i] = kstrdup(argv[i], GFP_KERNEL);
 		if (!copy[i]) {
