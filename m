From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Mon, 14 Feb 2005 22:02:53 +0000
Subject: [KJ] [PATCH][RESUBMIT][17/21] include/linux/* - compile warning
Message-Id: <42113C2D.26296.52C286@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29039136361047646=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29039136361047646==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - remove unmaintained rcs char 
string, extinguish warning for module structure that is still live when 
module is compiled into the kernel

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/include/linux/ixjuser.h linux-2.6.11-rc3-mm2/include/linux/ixjuser.h
--- linux-2.6.11-rc3-mm2-original/include/linux/ixjuser.h	2004-12-24 23:35:50.000000000 +0200
+++ linux-2.6.11-rc3-mm2/include/linux/ixjuser.h	2005-02-14 00:20:59.399225704 +0200
@@ -42,7 +42,6 @@
  *
  *****************************************************************************/
 
-static char ixjuser_h_rcsid[] = "$Id: ixjuser.h,v 4.1 2001/08/05 00:17:37 craigs Exp $";
 
 #include <linux/telephony.h>
 
diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/include/linux/module.h linux-2.6.11-rc3-mm2/include/linux/module.h
--- linux-2.6.11-rc3-mm2-original/include/linux/module.h	2005-02-12 12:06:39.000000000 +0200
+++ linux-2.6.11-rc3-mm2/include/linux/module.h	2005-02-13 23:23:16.000000000 +0200
@@ -84,7 +84,10 @@ extern const struct gtype##_id __mod_##g
 extern struct module __this_module;
 #define THIS_MODULE (&__this_module)
 #else  /* !MODULE */
-#define MODULE_GENERIC_TABLE(gtype,name)
+#define MODULE_GENERIC_TABLE(gtype,name)			\
+extern const struct gtype##_id __not_mod_##name##_unused	\
+  __attribute__ ((unused, weak, alias(__stringify(name))))
+
 #define THIS_MODULE ((struct module *)0)
 #endif
 




--===============29039136361047646==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29039136361047646==--
