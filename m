From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:49:37 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114937.GP2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7903626402889703=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============7903626402889703==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use list_for_each_entry to make code more readable.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/jffs/intrep.c	Wed Jul 14 19:15:11 2004
+++ list_for_each/fs/jffs/intrep.c	Wed Jul 28 20:34:06 2004
@@ -1619,12 +1619,10 @@
 {
 	struct jffs_file *f;
 	int i = ino % c->hash_len;
-	struct list_head *tmp;
 
 	D3(printk("jffs_find_file(): ino: %u\n", ino));
 
-	for (tmp = c->hash[i].next; tmp != &c->hash[i]; tmp = tmp->next) {
-		f = list_entry(tmp, struct jffs_file, hash);
+	list_for_each_entry(f, &c->hash[i], hash) {
 		if (ino != f->ino)
 			continue;
 		D3(printk("jffs_find_file(): Found file with ino "
@@ -2020,13 +2018,12 @@
 	int result = 0;
 
 	for (pos = 0; pos < c->hash_len; pos++) {
-		struct list_head *p, *next;
-		for (p = c->hash[pos].next; p != &c->hash[pos]; p = next) {
-			/* We need a reference to the next file in the
-			   list because `func' might remove the current
-			   file `f'.  */
-			next = p->next;
-			r = func(list_entry(p, struct jffs_file, hash));
+		struct jffs_file *f, *next;
+
+		/* We must do _safe, because 'func' might remove the
+		   current file 'f' from the list.  */
+		list_for_each_entry_safe(f, next, &c->hash[pos], hash) {
+			r = func(f);
 			if (r < 0)
 				return r;
 			result += r;
@@ -2589,9 +2586,8 @@
 
 	printk("JFFS: Dumping the file system's hash table...\n");
 	for (i = 0; i < c->hash_len; i++) {
-		struct list_head *p;
-		for (p = c->hash[i].next; p != &c->hash[i]; p = p->next) {
-			struct jffs_file *f=list_entry(p,struct jffs_file,hash);
+		struct jffs_file *f;
+		list_for_each_entry(f, &c->hash[i], hash) {
 			printk("*** c->hash[%u]: \"%s\" "
 			       "(ino: %u, pino: %u)\n",
 			       i, (f->name ? f->name : ""),

--===============7903626402889703==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7903626402889703==--
