From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Thu, 10 Feb 2005 21:34:27 +0000
Subject: [KJ] [PATCH][21/26] kernel/* - compile warning cleanup
Message-Id: <420BEF83.22379.5871C8@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78903969799033247=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78903969799033247==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

Description: compile warning cleanup - handle copy_to/from_user error 
returns

Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>

diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm-original/kernel/module.c linux-2.6.11-rc3-mm/kernel/module.c
--- linux-2.6.11-rc3-mm-original/kernel/module.c	2005-02-07 16:32:23.000000000 +0200
+++ linux-2.6.11-rc3-mm/kernel/module.c	2005-02-08 16:59:11.000000000 +0200
@@ -1402,7 +1402,10 @@ static void who_is_doing_it(void)
 	char args[512];
 	unsigned int i, len = current->mm->arg_end - current->mm->arg_start;
 
-	copy_from_user(args, (void *)current->mm->arg_start, len);
+	if(copy_from_user(args, (void *)current->mm->arg_start, len)) {
+		printk(KERN_ERR "%s: copy_from_user failed!\n",__FUNCTION__);
+		return;
+	}
 
 	for (i = 0; i < len; i++) {
 		if (args[i] == '\0')




--===============78903969799033247==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78903969799033247==--
