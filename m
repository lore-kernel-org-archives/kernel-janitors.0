From: Domen Puncer <domen@coderock.org>
Date: Thu, 29 Jul 2004 11:48:39 +0000
Subject: [Kernel-janitors] [patch 2.6.8-rc2] list_for_each_entry:
Message-Id: <20040729114839.GN2294@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44318618361479079=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040729114250.GB2294@masina.coderock.org>
In-Reply-To: <20040729114250.GB2294@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============44318618361479079==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use list_for_each_entry_safe to make code more readable.
Compile tested.


Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/fs/coda/psdev.c	Fri Jul 23 16:00:27 2004
+++ list_for_each/fs/coda/psdev.c	Wed Jul 28 20:10:31 2004
@@ -310,8 +310,7 @@
 static int coda_psdev_release(struct inode * inode, struct file * file)
 {
         struct venus_comm *vcp = (struct venus_comm *) file->private_data;
-        struct upc_req *req;
-	struct list_head *lh, *next;
+        struct upc_req *req, *tmp;
 
 	lock_kernel();
 	if ( !vcp->vc_inuse ) {
@@ -326,8 +325,7 @@
 	}
         
         /* Wakeup clients so they can return. */
-	list_for_each_safe(lh, next, &vcp->vc_pending) {
-		req = list_entry(lh, struct upc_req, uc_chain);
+	list_for_each_entry_safe(req, tmp, &vcp->vc_pending, uc_chain) {
 		/* Async requests need to be freed here */
 		if (req->uc_flags & REQ_ASYNC) {
 			CODA_FREE(req->uc_data, sizeof(struct coda_in_hdr));

--===============44318618361479079==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44318618361479079==--
