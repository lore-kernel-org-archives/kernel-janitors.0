From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][22/26] kernel/power/* - fix compile ERROR that stops
Message-Id: <420BEF83.13044.58713C@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53121188060538405=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============53121188060538405==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: Error in Andrew Morton's 2.6.11-rc3-mm that causes my GCC to 
error out due to no static inline function body before call of that 
function

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/kernel/power/swsusp.c linux-2.6.11-rc3-mm/kernel/power/swsusp.c
--- linux-2.6.11-rc3-mm-original/kernel/power/swsusp.c	2005-02-10 00:19:13.000000000 +0200
+++ linux-2.6.11-rc3-mm/kernel/power/swsusp.c	2005-02-07 12:42:09.000000000 +0200
@@ -605,7 +605,20 @@ static int calc_nr(int nr_copy)
 	return nr_copy;
 }
 
-static inline void free_pagedir(struct pbe *pblist);
+/**
+ *	free_pagedir - free pages allocated with alloc_pagedir()
+ */
+
+static inline void free_pagedir(struct pbe *pblist)
+{
+	struct pbe *pbe;
+
+	while (pblist) {
+		pbe = pblist + PB_PAGE_SKIP;
+		pblist = pbe->next;
+		free_page((unsigned long)pblist);
+	}
+}
 
 /**
  *	alloc_pagedir - Allocate the page directory.
@@ -651,21 +664,6 @@ static struct pbe * alloc_pagedir(unsign
 }
 
 /**
- *	free_pagedir - free pages allocated with alloc_pagedir()
- */
-
-static inline void free_pagedir(struct pbe *pblist)
-{
-	struct pbe *pbe;
-
-	while (pblist) {
-		pbe = pblist + PB_PAGE_SKIP;
-		pblist = pbe->next;
-		free_page((unsigned long)pblist);
-	}
-}
-
-/**
  *	free_image_pages - Free pages allocated for snapshot
  */
 




--===============53121188060538405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53121188060538405==--
