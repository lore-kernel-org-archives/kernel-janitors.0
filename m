From: milindchoudhary@gmail.com
Date: Tue, 03 Apr 2007 08:58:00 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <1175590680.037722.190490@p15g2000hsd.googlegroups.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Richard Knutsson wrote:
>
> There were recently a thread in LKML about C++-usage in the kernel (again).
> That reminded me, why do we have those "ifdef __cplusplus"? As an
> example, we have this (in include/linux/stddef.h) when defining NULL as
> 0 in C++ and ((void *)0) otherwise. From what I can see, there is no
> reason to have them, or am I missing something? (like they are needed by
> libraries)
>
> > grep -nr cplusplus * | wc -l
> 121
>
most of them are in
./scripts/genksyms/keywords.c_shipped
./scripts/genksyms/lex.c_shipped
./scripts/genksyms/parse.c_shipped
./scripts/kconfig/expr.h
./scripts/kconfig/lex.zconf.c_shipped
./scripts/kconfig/lkc.h
./scripts/kconfig/zconf.hash.c_shipped
./scripts/kconfig/zconf.tab.c_shipped
./Documentation/DocBook/kernel-hacking.tmpl
this shouldn't be a surprise

./include/linux/linkage.h
./include/linux/socket.h
./include/linux/stddef.h
./include/linux/string.h
if included from userspace

donno
./arch/ppc/mm/mem_pieces.h
./drivers/media/video/pwc/pwc.h


./drivers/net/sk98lin/h/lm80.h
./drivers/net/sk98lin/h/skaddr.h
./drivers/net/sk98lin/h/skgehw.h
./drivers/net/sk98lin/h/skgeinit.h
./drivers/net/sk98lin/h/skrlmt.h
./drivers/net/sk98lin/h/xmac_ii.h
./drivers/net/sk98lin/skaddr.c
./drivers/net/sk98lin/skdim.c
./drivers/net/sk98lin/skrlmt.c
i read some where that drivers are sometimes compile tested in
userspace

drivers/md/raid6.h:114:/* Some definitions to allow code to be
compiled for testing in userspace */
dosen't seem to be the case here but still.....

CMIIW

Milind A Choudhary

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
