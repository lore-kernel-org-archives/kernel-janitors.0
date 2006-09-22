From: "Om Narasimhan" <om.turyx@gmail.com>
Date: Fri, 22 Sep 2006 05:40:10 +0000
Subject: Re: [KJ] kmalloc to kzalloc patches for drivers/block [sane version]
Message-Id: <6b4e42d10609212240i3d02241djbdaa0176ab9bfb2b@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6b4e42d10609202311t47038692x5627f51d69f28209@mail.gmail.com>
	 <20060921072017.GA27798@us.ibm.com>
In-Reply-To: <20060921072017.GA27798@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org

Thanks for the comments.
> >
> > Signed off by Om Narasimhan <om.turyx@gmail.com>
>
> This is not the canonical format, per SubmittingPatches. It should be:
>
> Signed-off-by: Random J Developer <random@developer.example.org>
OK. I would take care of it.
>
> >  drivers/block/cciss.c    |    4 +--
> >  drivers/block/cpqarray.c |   72 +++++++++++++++-------------------------------
> >  drivers/block/loop.c     |    4 +--
> >  3 files changed, 25 insertions(+), 55 deletions(-)
>
> Your diffstat should have indicated to you that this should be split up
> better. Please (re-)read SubmittingPatches. *One* logical change per
> patch, most importantly.
OK. I would resubmit.
> >
> > diff --git a/drivers/block/cciss.c b/drivers/block/cciss.c
> > index 2cd3391..a800a69 100644
> > --- a/drivers/block/cciss.c
> > +++ b/drivers/block/cciss.c
> > @@ -900,7 +900,7 @@ #if 0                             /* 'buf_size' member is 16-bits
> >                               return -EINVAL;
> >  #endif
> >                       if (iocommand.buf_size > 0) {
> > -                             buff = kmalloc(iocommand.buf_size, GFP_KERNEL);
> > +                             buff = kzalloc(iocommand.buf_size, GFP_KERNEL);
> >                               if (buff = NULL)
> >                                       return -EFAULT;
> >                       }
> > @@ -911,8 +911,6 @@ #endif
> >                                       kfree(buff);
> >                                       return -EFAULT;
> >                               }
> > -                     } else {
> > -                             memset(buff, 0, iocommand.buf_size);
> >                       }
> >                       if ((c = cmd_alloc(host, 0)) = NULL) {
> >                               kfree(buff);
>
> This changes performance potentially, no? The memset before was
> conditional upon (iocommand.Request.Type.Direction = XFER_WRITE) and
> now the memory will always be zero'd.
Yes, but not the functionality.
if (iocommand.buf_size > 0), code allocates using kmalloc. if
direction is XFER_WRITE, it does a copy_from_user(), and free()s the
allocated buffer, not really caring what data came in from userspace.
Else, it does memset(). So I could safely replace the kmalloc() with
kzalloc() without compromising functionality.

Thanks,
Om.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
