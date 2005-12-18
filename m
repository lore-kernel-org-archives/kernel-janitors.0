From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 18 Dec 2005 22:00:08 +0000
Subject: [KJ] KERNEL_VERSION #ifs
Message-Id: <1134943209.7082.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============22520811017077058=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============22520811017077058==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

the kerneljanitor TODO states the following:
"- Code that depends on LINUX_VERSION_CODE & KERNEL_VERSION < 2.6 can be
  deleted in most cases. (Mostly/all? done)"

does this mean that an if like this

#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)

in arch/cris/arch-v32/kernel/fasttimer.c should also be
removed (Of course just the if, not the code inside it)

Thanks, Eric 


--===============22520811017077058==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============22520811017077058==--
