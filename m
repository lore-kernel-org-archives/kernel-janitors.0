From: Domen Puncer <domen@coderock.org>
Date: Thu, 19 Aug 2004 11:11:25 +0000
Subject: [Kernel-janitors] [patch 2.6.8.1] list_for_each:
Message-Id: <20040819111125.GA3517@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86845802584078868=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040819111118.GA3469@masina.coderock.org>
In-Reply-To: <20040819111118.GA3469@masina.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============86845802584078868==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi.

s/for/list_for_each/

Signed-off-by: Domen Puncer <domen@coderock.org>

--- c/arch/sparc/kernel/pcic.c	Wed Jun 16 07:19:29 2004
+++ list_for_each/arch/sparc/kernel/pcic.c	Thu Aug 15 17:58:22 2002
@@ -629,8 +629,7 @@
 		return;
 	}
 
-	walk = &bus->devices;
-	for (walk = walk->next; walk != &bus->devices; walk = walk->next) {
+	list_for_each(walk, &bus->devices) {
 		struct pci_dev *dev = pci_dev_b(walk);
 
 		/*

--===============86845802584078868==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86845802584078868==--
