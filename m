From: Domen Puncer <domen@coderock.org>
Date: Wed, 24 Nov 2004 15:28:40 +0000
Subject: [KJ] [patch 1/8] ifdef typos: arch_ppc_platforms_prep_setup.c
Message-Id: <20041124152840.GA14789@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49745981774581294=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============49745981774581294==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CONFIG_PREP_PRESIDUAL is mistyped.

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/ppc/platforms/prep_setup.c	2004-10-19 13:52:48.000000000 +0200
+++ str2/arch/ppc/platforms/prep_setup.c	2004-11-24 14:54:48.000000000 +0100
@@ -1126,7 +1126,7 @@ prep_init(unsigned long r3, unsigned lon
 		_prep_type = _PREP_Motorola;
 	}
 
-#ifdef CONFIG_PREP_PRESIDUAL
+#ifdef CONFIG_PREP_RESIDUAL
 	/* Switch off all residual data processing if the user requests it */
 	if (strstr(cmd_line, "noresidual") != NULL)
 			res = NULL;

--===============49745981774581294==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49745981774581294==--
