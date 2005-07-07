From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 07 Jul 2005 15:44:35 +0000
Subject: [KJ] [patch 2.6.13-rc1 01/23] Audit return code of create_proc_*
Message-Id: <20050707154513.561800000@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83627744479421673=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============83627744479421673==
Content-Disposition: inline; filename=proc_create_net_sctp_objcnt.c.diff

diff -urpNX dontdiff 2.6.13-rc1.orig/net/sctp/objcnt.c 2.6.13-rc1/net/sctp/objcnt.c
--- 2.6.13-rc1.orig/net/sctp/objcnt.c	2005-06-29 07:57:29.000000000 +0200
+++ 2.6.13-rc1/net/sctp/objcnt.c	2005-07-05 11:27:00.319634800 +0200
@@ -127,8 +127,12 @@ done:
 /* Initialize the objcount in the proc filesystem.  */
 void sctp_dbg_objcnt_init(void)
 {
-	create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
+	struct proc_dir_entry* ent;
+	ent = create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
 			       sctp_dbg_objcnt_read, NULL);
+	if (!ent)
+		printk(KERN_WARNING 
+			"sctp_dbg_objcnt: Unable to create /proc entry.\n");
 }
 
 /* Cleanup the objcount entry in the proc filesystem.  */

--

--===============83627744479421673==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83627744479421673==--
