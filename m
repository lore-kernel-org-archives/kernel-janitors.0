From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:50:38 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729115038.GR2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============96647008233041665=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============96647008233041665==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use list_for_each_entry_reverse to make code more readable
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/sound/core/memory.c	Wed Jun 16 07:18:57 2004
+++ list_for_each/sound/core/memory.c	Wed Jul 28 20:41:32 2004
@@ -64,25 +64,20 @@
 
 void snd_memory_done(void)
 {
-	struct list_head *head;
 	struct snd_alloc_track *t;
 
 	if (snd_alloc_kmalloc > 0)
 		snd_printk(KERN_ERR "Not freed snd_alloc_kmalloc = %li\n", snd_alloc_kmalloc);
 	if (snd_alloc_vmalloc > 0)
 		snd_printk(KERN_ERR "Not freed snd_alloc_vmalloc = %li\n", snd_alloc_vmalloc);
-	for (head = snd_alloc_kmalloc_list.prev;
-	     head != &snd_alloc_kmalloc_list; head = head->prev) {
-		t = list_entry(head, struct snd_alloc_track, list);
+	list_for_each_entry_reverse(t, &snd_alloc_kmalloc_list, list) {
 		if (t->magic != KMALLOC_MAGIC) {
 			snd_printk(KERN_ERR "Corrupted kmalloc\n");
 			break;
 		}
 		snd_printk(KERN_ERR "kmalloc(%ld) from %p not freed\n", (long) t->size, t->caller);
 	}
-	for (head = snd_alloc_vmalloc_list.prev;
-	     head != &snd_alloc_vmalloc_list; head = head->prev) {
-		t = list_entry(head, struct snd_alloc_track, list);
+	list_for_each_entry_reverse(t, &snd_alloc_vmalloc_list, list) {
 		if (t->magic != VMALLOC_MAGIC) {
 			snd_printk(KERN_ERR "Corrupted vmalloc\n");
 			break;

--===============96647008233041665==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============96647008233041665==--
