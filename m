From: Domen Puncer <domen@coderock.org>
Date: Sat, 14 Aug 2004 17:09:08 +0000
Subject: [Kernel-janitors] [patch 2.6.8] list_for_each_entry in fs/dcache.c
Message-Id: <20040814170908.GA2575@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88575140249588347=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88575140249588347==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

First 2 are list_for_each_entry (thanks maks), second 2 list_for_each_safe.
Boot tested.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/dcache.c	Sat Aug 14 10:57:28 2004
+++ a/fs/dcache.c	Sat Aug 14 18:53:51 2004
@@ -288,17 +288,10 @@
 
 struct dentry * d_find_alias(struct inode *inode)
 {
-	struct list_head *head, *next, *tmp;
 	struct dentry *alias, *discon_alias=NULL;
 
 	spin_lock(&dcache_lock);
-	head = &inode->i_dentry;
-	next = inode->i_dentry.next;
-	while (next != head) {
-		tmp = next;
-		next = tmp->next;
-		prefetch(next);
-		alias = list_entry(tmp, struct dentry, d_alias);
+	list_for_each_entry(alias, &inode->i_dentry, d_alias) {
  		if (!d_unhashed(alias)) {
 			if (alias->d_flags & DCACHE_DISCONNECTED)
 				discon_alias = alias;
@@ -321,12 +314,10 @@
  */
 void d_prune_aliases(struct inode *inode)
 {
-	struct list_head *tmp, *head = &inode->i_dentry;
+	struct dentry *dentry;
 restart:
 	spin_lock(&dcache_lock);
-	tmp = head;
-	while ((tmp = tmp->next) != head) {
-		struct dentry *dentry = list_entry(tmp, struct dentry, d_alias);
+	list_for_each_entry(dentry, &inode->i_dentry, d_alias) {
 		if (!atomic_read(&dentry->d_count)) {
 			__dget_locked(dentry);
 			__d_drop(dentry);
@@ -442,10 +433,7 @@
 	 * superblock to the most recent end of the unused list.
 	 */
 	spin_lock(&dcache_lock);
-	next = dentry_unused.next;
-	while (next != &dentry_unused) {
-		tmp = next;
-		next = tmp->next;
+	list_for_each_safe(tmp, next, &dentry_unused) {
 		dentry = list_entry(tmp, struct dentry, d_lru);
 		if (dentry->d_sb != sb)
 			continue;
@@ -457,10 +445,7 @@
 	 * Pass two ... free the dentries for this superblock.
 	 */
 repeat:
-	next = dentry_unused.next;
-	while (next != &dentry_unused) {
-		tmp = next;
-		next = tmp->next;
+	list_for_each_safe(tmp, next, &dentry_unused) {
 		dentry = list_entry(tmp, struct dentry, d_lru);
 		if (dentry->d_sb != sb)
 			continue;

--===============88575140249588347==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88575140249588347==--
