From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 15 Oct 2012 02:25:21 +0000
Subject: [signal:arch-blackfin 1/2] arch/blackfin/kernel/process.c:170:7: error: request for member 'pc' in s
Message-Id: <20121015022521.GF7203@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hi Al,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git arch-=
blackfin
head:   9b34bed403644c57e9beefc36a0b353255c696f1
commit: 1ac0bc7b1705368131dc176f4a094994ea45e478 [1/2] blackfin: convert ke=
rnel_thread() and kernel_execve() to generic ones
config: blackfin-BF533-EZKIT_defconfig # make ARCH=3Dblackfin BF533-EZKIT_d=
efconfig

All error/warnings:

arch/blackfin/kernel/process.c: In function 'copy_thread':
arch/blackfin/kernel/process.c:170:7: error: request for member 'pc' in som=
ething not a structure or union
arch/blackfin/kernel/process.c:170:28: error: 'kernel_thread_helper' undecl=
ared (first use in this function)
arch/blackfin/kernel/process.c:170:28: note: each undeclared identifier is =
reported only once for each function it appears in

vim +170 arch/blackfin/kernel/process.c

1394f032 Bryan Wu 2007-05-06  164  	childregs =3D (struct pt_regs *) (task_=
stack_page(p) + THREAD_SIZE) - 1;
1ac0bc7b Al Viro  2012-10-13  165  	v =3D ((unsigned long *)childregs) - 2;
1ac0bc7b Al Viro  2012-10-13  166  	if (unlikely(!regs)) {
1ac0bc7b Al Viro  2012-10-13  167  		memset(childregs, 0, sizeof(struct pt_=
regs));
1ac0bc7b Al Viro  2012-10-13  168  		v[0] =3D usp;
1ac0bc7b Al Viro  2012-10-13  169  		v[1] =3D topstk;
1ac0bc7b Al Viro  2012-10-13 @170  		regs.pc =3D (unsigned long)kernel_thre=
ad_helper;
1ac0bc7b Al Viro  2012-10-13  171  		childregs->orig_p0 =3D -1;
1ac0bc7b Al Viro  2012-10-13  172  		childregs->ipend =3D 0x8000;
1ac0bc7b Al Viro  2012-10-13  173  		__asm__ __volatile__("%0 =3D syscfg;":=
"=DA"(childregs->syscfg):);

---
0-DAY kernel build testing backend         Open Source Technology Center
Fengguang Wu, Yuanhan Liu                              Intel Corporation
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
