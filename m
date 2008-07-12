From: Jaswinder Singh <jaswinder@infradead.org>
Date: Sat, 12 Jul 2008 07:49:23 +0000
Subject: Re: [PATCH] init: fix sparse warnings
Message-Id: <1215848924.19076.18.camel@jaswinder.satnam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080712073504.GA31600@martell.zuzino.mipt.ru>
In-Reply-To: <20080712073504.GA31600@martell.zuzino.mipt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hello Alexey,

On Sat, 2008-07-12 at 11:35 +0400, Alexey Dobriyan wrote:
> >  
> > +const char __user cuold[] = "/old";
> > +char __user uold[] = "/old";
> > +const char __user curoot[] = "/";
> > +char __user uroot[] = "/";
> > +const char __user curootroot[] = "/root";
> > +char __user urootroot[] = "/root";
> > +const char __user cudot[] = ".";
> > +char __user udot[] = ".";
> > +const char __user cuinitrd[] = "/root/initrd";
> > +char __user uinitrd[] = "/root/initrd";
> > +/* devs */
> > +const char __user cudevram[] = "/dev/ram";
> > +char __user udevram[] = "/dev/ram";
> > +const char __user cudevconsole[] = "/dev/console";
> > +char __user udevconsole[] = "/dev/console";
> > +const char __user cudevroot[] = "/dev/root";
> > +char __user udevroot[] = "/dev/root";
> > +const char __user cudevrootold[] = "/dev/root.old";
> > +char __user udevrootold[] = "/dev/root.old";
> 
> Oh, c'mon!

This looks ugly. But I am able to remove all sparse warnings
of ﻿init/do_mounts_initrd.c by above stuff. 

  CHECK   init/do_mounts_initrd.c
  CC      init/do_mounts_initrd.o

﻿Can you suggest me some nicer way.

Thank you,

Jaswinder Singh.

