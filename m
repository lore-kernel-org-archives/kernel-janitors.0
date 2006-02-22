From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 22 Feb 2006 19:14:25 +0000
Subject: Re: [KJ] [Patch] kzalloc conversion in fs/proc
Message-Id: <20060222191425.GA27362@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============62430029270361875=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140562907.26848.0.camel@alice>
In-Reply-To: <1140562907.26848.0.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============62430029270361875==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 22, 2006 at 01:14:39AM +0100, Jesper Juhl wrote:
> On 2/22/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> > On Wed, 2006-02-22 at 00:13 +0100, Jesper Juhl wrote:
> > > This looks broken - did you even compile test that patch?
> > >
> > > Don't you mean :
> > >
> > > return kzalloc(sizeof(struct vmcore), GFP_KERNEL);
> >
> > *yuck*, sorry for this, didnt compile test since it doesnt build
> > with my config. fixed patch below.
> >
>
> Hmm, a simple
>
> $ make allyesconfig
> $ make fs/proc/kcore.o

How on earth did this succeed? I always, always get

$ make fs/proc/kcore.o
  SPLIT   include/linux/autoconf.h -> include/config/*
  HOSTCC  scripts/genksyms/genksyms.o
  SHIPPED scripts/genksyms/lex.c
  SHIPPED scripts/genksyms/parse.h
  SHIPPED scripts/genksyms/keywords.c
  HOSTCC  scripts/genksyms/lex.o
  SHIPPED scripts/genksyms/parse.c
  HOSTCC  scripts/genksyms/parse.o
  HOSTLD  scripts/genksyms/genksyms
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/modpost.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTLD  scripts/mod/modpost
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/pnmtologo
  HOSTCC  scripts/conmakehash
  HOSTCC  scripts/bin2c
  CC      fs/proc/kcore.o
In file included from include/linux/mm.h:4,
                 from fs/proc/kcore.c:13:
include/linux/sched.h:4:36: asm/param.h: No such file or directory

Some secret agreement with devil you've signed?

> or
>
> $ make fs/proc/
>
> builds it for me. No reason why you couldn't have made the same test.




--===============62430029270361875==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============62430029270361875==--
