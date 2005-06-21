From: randy_dunlap <rdunlap@xenotime.net>
Date: Tue, 21 Jun 2005 19:30:42 +0000
Subject: Re: [KJ] [PATCH] Audit return code : drivers/char/applicom.c
Message-Id: <20050621123042.29aa094a.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84505141458982358=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050621101313.GE4880@rhum.iomeda.fr>
In-Reply-To: <20050621101313.GE4880@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============84505141458982358==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 21 Jun 2005 12:13:13 +0200 Christophe Lucas wrote:

| description:
| Audit return codes (and handle failure correctly) for misc_register.


diff -urpNX dontdiff 2.6.12-orig/drivers/char/applicom.c 2.6.12/drivers/char/applicom.c
--- 2.6.12-orig/drivers/char/applicom.c	2005-06-17 21:48:29.000000000 +0200
+++ 2.6.12/drivers/char/applicom.c	2005-06-21 11:25:19.448714976 +0200
@@ -172,7 +172,7 @@ static int ac_register_board(unsigned lo
 
 void cleanup_module(void)
 {
-	int i;
+	unsigned int i;

what is the purpose of this change?  no description for it.


+	return ret ;

what Alexey said...

---
~Randy

--===============84505141458982358==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84505141458982358==--
