From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 13:27:42 +0000
Subject: [PATCH] s390/cpum_cf: Use kmalloc_array() in merge_attr()
Message-Id: <97bb5de4-f9c1-1e2c-cf39-3ecfee114d52@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, =?UTF-8?Q?Hendrik_Br=c3=bcckner?= <brueckner@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Sep 2016 15:17:45 +0200

* A multiplication for the size determination of a memory allocation
  indicated that an array data structure should be processed.
  Thus reuse the corresponding function "kmalloc_array".

* Replace the specification of a data type by a pointer dereference
  to make the corresponding size determination a bit safer according to
  the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/perf_cpum_cf_events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kernel/perf_cpum_cf_events.c b/arch/s390/kernel/perf_cpum_cf_events.c
index 4554a4b..0d6340b 100644
--- a/arch/s390/kernel/perf_cpum_cf_events.c
+++ b/arch/s390/kernel/perf_cpum_cf_events.c
@@ -274,7 +274,7 @@ static __init struct attribute **merge_attr(struct attribute **a,
 		j++;
 	j++;
 
-	new = kmalloc(sizeof(struct attribute *) * j, GFP_KERNEL);
+	new = kmalloc_array(j, sizeof(*new), GFP_KERNEL);
 	if (!new)
 		return NULL;
 	j = 0;
-- 
2.9.3

