From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 15 Feb 2005 06:35:20 +0000
Subject: [KJ] [PATCH] include/linux/module.h - compile warning cleanup
Message-Id: <4211B448.6986.FF9F7@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============31104449583230709=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============31104449583230709==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: , extinguish warning for module structure that is still 
live when module is compiled into the kernel; do this in one central 
place so all such type warnings are automatically taken care of

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

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
 



--===============31104449583230709==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============31104449583230709==--
