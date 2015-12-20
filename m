From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 07:00:29 +0000
Subject: [PATCH] XFS: Use a signed return type for suffix_kstrtoint()
Message-Id: <5676520D.2060806@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: xfs@oss.sgi.com, Dave Chinner <david@fromorbit.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 20 Dec 2015 07:56:36 +0100

The return type "unsigned long" was used by the suffix_kstrtoint()
function even though it will eventually return a negative error code.
Improve this implementation detail by using the type "int" instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 fs/xfs/xfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 436b6ef..59c9b7b 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -137,7 +137,7 @@ static const match_table_t tokens = {
 };
 
 
-STATIC unsigned long
+STATIC int
 suffix_kstrtoint(char *s, unsigned int base, int *res)
 {
 	int	last, shift_left_factor = 0, _res;
-- 
2.6.3

