From: Coywolf Qi Hunt <coywolf@gmail.com>
Date: Tue, 08 Mar 2005 18:34:00 +0000
Subject: [KJ] [patch] fix typo in pm.h
Message-Id: <2cd57c90050308103414c5aef6@mail.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32016376604160923=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32016376604160923==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

This patch fixes a typo in PMSG_ comment in pm.h.

Signed-off-by: Coywolf Qi Hunt <coywolf@gmail.com>

diff -Nrup 2.6.11/include/linux/pm.h 2.6.11-cy/include/linux/pm.h
--- 2.6.11/include/linux/pm.h	2005-03-03 17:12:14.000000000 +0800
+++ 2.6.11-cy/include/linux/pm.h	2005-03-09 02:27:07.000000000 +0800
@@ -208,7 +208,7 @@ typedef u32 __bitwise pm_message_t;
  *           pci D3.
  *
  * Unfortunately, current drivers only recognize numeric values 0
(ON) and 3 (SUSPEND).
- * We'll need to fix the drivers. So yes, putting 3 to all diferent
defines is intentional,
+ * We'll need to fix the drivers. So yes, putting 3 to all different
defines is intentional,
  * and will go away as soon as drivers are fixed. Also note that
typedef is neccessary,
  * we'll probably want to switch to
  *   typedef struct pm_message_t { int event; int flags; } pm_message_t

-- 
Coywolf Qi Hunt
Homepage http://sosdg.org/~coywolf/

--===============32016376604160923==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32016376604160923==--
