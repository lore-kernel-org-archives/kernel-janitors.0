From: Baruch Even <baruch@ev-en.org>
Date: Wed, 17 Aug 2005 22:19:32 +0000
Subject: [KJ] [PATCH] proc_ipmi_root depends on CONFIG_PROC_FS
Message-Id: <4303B7F4.4060407@ev-en.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040000080707000904000306"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel list <linux-kernel@vger.kernel.org>, kernel-janitors@osdl.org, Corey Minyard <minyard@mvista.com>

This is a multi-part message in MIME format.
--------------040000080707000904000306
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


--------------040000080707000904000306
Content-Type: text/x-patch;
 name="ipmi_proc_fs.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="ipmi_proc_fs.patch"

proc_ipmi_root is only defined for CONFIG_PROC_FS, #ifdef it for export as well.

Signed-Off-By: Baruch Even <baruch@ev-en.org>

--
 drivers/char/ipmi/ipmi_msghandler.c |    2 ++
 1 files changed, 2 insertions(+)

Index: k/drivers/char/ipmi/ipmi_msghandler.c
===================================================================
--- k.orig/drivers/char/ipmi/ipmi_msghandler.c
+++ k/drivers/char/ipmi/ipmi_msghandler.c
@@ -3194,5 +3194,7 @@ EXPORT_SYMBOL(ipmi_get_my_address);
 EXPORT_SYMBOL(ipmi_set_my_LUN);
 EXPORT_SYMBOL(ipmi_get_my_LUN);
 EXPORT_SYMBOL(ipmi_smi_add_proc_entry);
+#ifdef CONFIG_PROC_FS
 EXPORT_SYMBOL(proc_ipmi_root);
+#endif
 EXPORT_SYMBOL(ipmi_user_set_run_to_completion);

--------------040000080707000904000306
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040000080707000904000306--
