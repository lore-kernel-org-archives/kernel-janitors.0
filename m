From: Domen Puncer <domen@coderock.org>
Date: Tue, 07 Dec 2004 14:05:36 +0000
Subject: [KJ] [patch] ppc64: semicolon in rtasd.c
Message-Id: <20041207140536.GA31550@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40355002584790967=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40355002584790967==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

Comments and identiation suggest this was wrong.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc64/kernel/rtasd.c	2004-12-02 23:16:09.000000000 +0100
+++ a/arch/ppc64/kernel/rtasd.c	2004-12-07 14:54:44.000000000 +0100
@@ -485,7 +485,7 @@ static int __init rtas_init(void)
 
 	/* No RTAS, only warn if we are on a pSeries box  */
 	if (rtas_token("event-scan") == RTAS_UNKNOWN_SERVICE) {
-		if (systemcfg->platform & PLATFORM_PSERIES);
+		if (systemcfg->platform & PLATFORM_PSERIES)
 			printk(KERN_ERR "rtasd: no RTAS on system\n");
 		return 1;
 	}

--===============40355002584790967==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40355002584790967==--
