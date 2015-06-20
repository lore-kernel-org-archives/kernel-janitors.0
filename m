From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 20 Jun 2015 19:07:49 +0000
Subject: [PATCH 1/5] staging: lustre: libcfs: drop trivially useless initialization
Message-Id: <1434827273-13929-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1434827273-13929-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <oleg.drokin@intel.com>
Cc: kernel-janitors@vger.kernel.org, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, HPDD-discuss@ml01.01.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove initialization of a variable that is immediately reassigned.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
identifier x;
constant C;
expression e;
@@

T x
- = C
 ;
x = e;
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/lustre/lustre/libcfs/fail.c       |    2 +-
 drivers/staging/lustre/lustre/libcfs/libcfs_cpu.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/staging/lustre/lustre/libcfs/libcfs_cpu.c b/drivers/staging/lustre/lustre/libcfs/libcfs_cpu.c
--- a/drivers/staging/lustre/lustre/libcfs/libcfs_cpu.c
+++ b/drivers/staging/lustre/lustre/libcfs/libcfs_cpu.c
@@ -78,7 +78,7 @@ EXPORT_SYMBOL(cfs_cpt_table_free);
 int
 cfs_cpt_table_print(struct cfs_cpt_table *cptab, char *buf, int len)
 {
-	int	rc = 0;
+	int	rc;
 
 	rc = snprintf(buf, len, "%d\t: %d\n", 0, 0);
 	len -= rc;
diff -u -p a/drivers/staging/lustre/lustre/libcfs/fail.c b/drivers/staging/lustre/lustre/libcfs/fail.c
--- a/drivers/staging/lustre/lustre/libcfs/fail.c
+++ b/drivers/staging/lustre/lustre/libcfs/fail.c
@@ -123,7 +123,7 @@ EXPORT_SYMBOL(__cfs_fail_check_set);
 
 int __cfs_fail_timeout_set(__u32 id, __u32 value, int ms, int set)
 {
-	int ret = 0;
+	int ret;
 
 	ret = __cfs_fail_check_set(id, value, set);
 	if (ret) {

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
