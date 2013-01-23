From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 23 Jan 2013 08:38:37 +0000
Subject: Re: [patch] drm/nouveau/disp: sizeof() wrong pointer
Message-Id: <20130123083837.GZ4584@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130122072022.GB8966@elgon.mountain>
	<1358847745.17068.7.camel@mattotaupa>
In-Reply-To: <1358847745.17068.7.camel@mattotaupa>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Menzel <paulepanter@users.sourceforge.net>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

On Tue, Jan 22, 2013 at 10:42:25AM +0100, Paul Menzel wrote:
> 
> Did you find this by manual inspection or did you use some tool?
> 

I found this because it caused a problem in a parser I was working
on but Sparse warns about "warning: expression using sizeof(void)".

It's sort of hard to run Sparse on nouveau because you can't build
the individual .o files.

$ kchecker --sparse drivers/gpu/drm/nouveau/core/engine/disp/nv50.c
make[1]: Nothing to be done for `all'.
make[1]: Nothing to be done for `relocs'.
  CHK     include/generated/uapi/linux/version.h
  CHK     include/generated/utsrelease.h
  CALL    scripts/checksyscalls.sh
<stdin>:1223:2: warning: #warning syscall finit_module not implemented [-Wcpp]
scripts/Makefile.build:44: /home/dcarpenter/progs/kernel/devel/drivers/gpu/drm/nouveau/core/engine/disp/Makefile: No such file or directory
make[1]: *** No rule to make target `/home/dcarpenter/progs/kernel/devel/drivers/gpu/drm/nouveau/core/engine/disp/Makefile'.  Stop.
make: *** [drivers/gpu/drm/nouveau/core/engine/disp/nv50.o] Error 2

regards,
dan carpenter

