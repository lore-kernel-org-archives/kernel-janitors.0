From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Sep 2016 12:32:06 +0000
Subject: [PATCH 13/17] s390/debug: Improve a size determination in debug_open()
Message-Id: <6f816bfa-ea0b-dd1a-24ba-5aeea7519276@users.sourceforge.net>
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
Date: Fri, 2 Sep 2016 09:02:22 +0200

* Replace the specification of a data type by a pointer dereference
  as the parameter for the operator "sizeof" to make the corresponding size
  determination a bit safer according to the Linux coding style convention.

* Improve source code layout for one function call.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/kernel/debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/s390/kernel/debug.c b/arch/s390/kernel/debug.c
index a9fcf72..32ceb5e 100644
--- a/arch/s390/kernel/debug.c
+++ b/arch/s390/kernel/debug.c
@@ -636,8 +636,7 @@ debug_open(struct inode *inode, struct file *file)
 		rc = -ENOMEM;
 		goto unlock;
 	}
-	p_info = kmalloc(sizeof(file_private_info_t),
-						GFP_KERNEL);
+	p_info = kmalloc(sizeof(*p_info), GFP_KERNEL);
 	if (!p_info) {
 		debug_info_free(debug_info_snapshot);
 		rc = -ENOMEM;
-- 
2.9.3

