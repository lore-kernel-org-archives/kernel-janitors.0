From: Nicolas Kaiser <nikai@nikai.net>
Date: Tue, 08 Mar 2005 21:13:43 +0000
Subject: Re: [KJ] [patch] fix typo in pm.h
Message-Id: <20050308221343.4b8c4e89@lucky.kitzblitz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29432102781396319=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2cd57c90050308103414c5aef6@mail.gmail.com>
In-Reply-To: <2cd57c90050308103414c5aef6@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============29432102781396319==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

* Coywolf Qi Hunt <coywolf@gmail.com>:
> This patch fixes a typo in PMSG_ comment in pm.h.
> 
> Signed-off-by: Coywolf Qi Hunt <coywolf@gmail.com>

I just spotted two more. Patch together with your one.

--- linux-2.6.11/include/linux/pm.h.orig	2005-03-08 21:58:41.000000000 +0100
+++ linux-2.6.11/include/linux/pm.h	2005-03-08 22:01:08.000000000 +0100
@@ -153,7 +153,7 @@
 #endif /* CONFIG_PM */
 
 /* Functions above this comment are list-based old-style power
- * managment. Please avoid using them.  */
+ * management. Please avoid using them.  */
 
 /*
  * Callbacks for platform drivers to implement.
@@ -208,8 +208,8 @@
  *           pci D3.
  *
  * Unfortunately, current drivers only recognize numeric values 0 (ON) and 3 (SUSPEND).
- * We'll need to fix the drivers. So yes, putting 3 to all diferent defines is intentional,
- * and will go away as soon as drivers are fixed. Also note that typedef is neccessary,
+ * We'll need to fix the drivers. So yes, putting 3 to all different defines is intentional,
+ * and will go away as soon as drivers are fixed. Also note that typedef is necessary,
  * we'll probably want to switch to
  *   typedef struct pm_message_t { int event; int flags; } pm_message_t
  * or something similar soon.

--===============29432102781396319==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29432102781396319==--
