From: Chris Sanford <crsanford@gmail.com>
Date: Sun, 03 May 2009 20:25:37 +0000
Subject: [PATCH] (void*) cast removal
Message-Id: <20090503202537.GC4945@chrisubuntu-laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


This is a trivial patch that removes an unnecessary void pointer cast.
This is my first time submitting a patch so I am unsure who else to
send it to.  Should this also be sent to the trivial mailling list?

Signed-off-by: Chris Sanford <crsanford@gmail.com>

---

--- linux-2.6/sound/oss/msnd.c
+++ linux-2.6/sound/oss/msnd.c
@@ -100,7 +100,7 @@ void msnd_fifo_free(msnd_fifo *f)
 int msnd_fifo_alloc(msnd_fifo *f, size_t n)
 {
 	msnd_fifo_free(f);
-	f->data = (char *)vmalloc(n);
+	f->data = vmalloc(n);
 	f->n = n;
 	f->tail = 0;
 	f->head = 0;
