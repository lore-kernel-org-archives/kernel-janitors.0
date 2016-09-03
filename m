From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:36:09 +0000
Subject: [PATCH 15/17] s390/debug: Improve a size determination in debug_raw_header_fn()
Message-Id: <d24081eb-6ad4-d7a5-c759-9cf303efb0b2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
In-Reply-To: <e4359dc9-9e20-e33b-9743-9ebade853268@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, David Hildenbrand <dahi@linux.vnet.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Joe Perches <joe@perches.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Sep 2016 14:34:22 +0200

* Replace the specification of a data type by pointer dereferences
  as the parameter for the operator "sizeof" to make the corresponding size
  determination a bit safer according to the Linux coding style convention.

* Return a constant directly without storing the desired value
  in a local variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index 6792a9c..ff8e705 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -1380,11 +1380,8 @@ static int
 debug_raw_header_fn(debug_info_t * id, struct debug_view *view,
 			int area, debug_entry_t * entry, char *out_buf)
 {
-	int rc;
-
-	rc = sizeof(debug_entry_t);
-	memcpy(out_buf, entry, sizeof(debug_entry_t));
-	return rc;
+	memcpy(out_buf, entry, sizeof(*entry));
+	return sizeof(*entry);
 }
 
 /*
-- 
2.9.3

