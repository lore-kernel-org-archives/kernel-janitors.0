From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 08 Jul 2005 10:16:00 +0000
Subject: [KJ] [patch 2.6.13-rc1 01/23][RESEND] Audit return code of
Message-Id: <20050708101600.GK4683@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32416885886475733=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32416885886475733==
Content-Disposition: inline
Content-Type: text/plain; charset=us-ascii

Description:
Audit return of create_proc_* functions.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: 2.6.13-rc1/net/sctp/objcnt.c
===================================================================
--- 2.6.13-rc1.orig/net/sctp/objcnt.c
+++ 2.6.13-rc1/net/sctp/objcnt.c
@@ -127,8 +127,12 @@ done:
 /* Initialize the objcount in the proc filesystem.  */
 void sctp_dbg_objcnt_init(void)
 {
-	create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
+	struct proc_dir_entry *ent;
+	ent = create_proc_read_entry("sctp_dbg_objcnt", 0, proc_net_sctp,
 			       sctp_dbg_objcnt_read, NULL);
+	if (!ent)
+		printk(KERN_WARNING 
+			"sctp_dbg_objcnt: Unable to create /proc entry.\n");
 }
 
 /* Cleanup the objcount entry in the proc filesystem.  */

--===============32416885886475733==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32416885886475733==--
