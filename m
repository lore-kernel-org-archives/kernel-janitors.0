From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:49:05 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry: fs-dquot.c
Message-Id: <20040729114905.GO2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25380646832468723=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============25380646832468723==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Make code more readable with list_for_each_entry_safe.
(Didn't compile before, doesn't compile now)


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/dquot.c	Wed Jul 14 19:15:11 2004
+++ list_for_each/fs/dquot.c	Wed Jul 28 20:20:52 2004
@@ -406,13 +406,10 @@
  * for this sb+type at all. */
 static void invalidate_dquots(struct super_block *sb, int type)
 {
-	struct dquot *dquot;
-	struct list_head *head;
+	struct dquot *dquot, *tmp;
 
 	spin_lock(&dq_list_lock);
-	for (head = inuse_list.next; head != &inuse_list;) {
-		dquot = list_entry(head, struct dquot, dq_inuse);
-		head = head->next;
+	list_for_each_entry_safe(dquot, tmp, &inuse_list, dq_inuse) {
 		if (dquot->dq_sb != sb)
 			continue;
 		if (dquot->dq_type != type)

--===============25380646832468723==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25380646832468723==--
