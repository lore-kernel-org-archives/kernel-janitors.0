From: Ian Romanick <ianr@q7.com>
Date: Tue, 08 Jul 2008 15:22:25 +0000
Subject: Re: [PATCH] drm_memory.h: remove double inclusion of linux/vmalloc.h
Message-Id: <20080708152225.GA9028@q7.q7.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a4423d670807060431w639f0b1ajcbad6471d50ef802@mail.gmail.com> <919fe2b30807080529j71ae1816sc035c90b5eee555c@mail.gmail.com>
In-Reply-To: <919fe2b30807080529j71ae1816sc035c90b5eee555c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Asselstine <asselsm@gmail.com>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, airlied@linux.ie, dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jul 08, 2008 at 08:29:57AM -0400, Mark Asselstine wrote:
> On Sun, Jul 6, 2008 at 7:31 AM, Alexander Beregalov
> <a.beregalov@gmail.com> wrote:
> > From: Alexander Beregalov <a.beregalov@gmail.com>
> >
> >  #if __OS_HAS_AGP
> >
> > -#include <linux/vmalloc.h>
> > -
> 
> Why remove this one and not the one at the top of the file? As well

I would assume this one is removed because it is inside additional
ifdefs.

> this file has #include of drmP.h, yet drmP.h is the only file I can
> find that includes drm_memory.h. Based on this I would think there is
> some additional cleanup that can go on here.

