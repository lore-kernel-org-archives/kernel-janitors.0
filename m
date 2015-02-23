From: =?windows-1252?Q?Noralf_Tr=F8nnes?= <noralf@tronnes.org>
Date: Mon, 23 Feb 2015 19:27:49 +0000
Subject: Re: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <54EB7F35.6040605@tronnes.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com> <20150221185824.GE5206@mwanda> <CANZNk82SkziecUNCShZu-cjqTHqKCF5UumMazJtNp2upt8qZJg@mail.gmail.com> <20150223183544.GB5064@mwanda>
In-Reply-To: <20150223183544.GB5064@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-mentors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


>>>> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/=
fbtft/fb_agm1264k-fl.c
>>>> index 9cc7d25..9114239 100644
>>>> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
>>>> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
>>>> @@ -273,7 +273,7 @@ construct_line_bitmap(struct fbtft_par *par, u8 *d=
est, signed short *src,
>>>>
>>>>   static int write_vmem(struct fbtft_par *par, size_t offset, size_t l=
en)
>>>>   {
>>>> -     u16 *vmem16 =3D (u16 *)par->info->screen_base;
>>>> +     u16 __iomem *vmem16 =3D (u16 __iomem *)par->info->screen_base;
>>> I haven't looked.  What is the type for ->screen_base and why can't it
>>> be declared as __iomem type?
>> http://lxr.free-electrons.com/source/include/linux/fb.h#L486
>> screen_base is component of struct fb_info, defined as "char __iomem *".
>> In drivers/staging/fbtft/fbtft-core.c, it looks to be actually set to
>> a pointer resulting from vzalloc().
> Hm, you're right.  Normally, it's an __iomem * but this time it's not
> an __iomem pointer.  Adding anotations to mark it as __iomem is wrong
> and adding calls to ioread16() is buggy.
>
> There are a couple ways to make these warnings go away.  The simplest
> is just to silence the warning with __force:
>
> 	u16 *vmem16 =3D (u16 __force *)par->info->screen_base;

This is how some fbdev drivers with vmalloc'ed memory does this:

video/fbdev/{metronomefb.c,hecubafb.c}:
unsigned char *buf =3D (unsigned char __force *)par->info->screen_base;
info->screen_base =3D (char __force __iomem *)videomemory;

drivers/video/fbdev/ssd1307fb.c (this one is quite new: 3.15):
u8 __iomem *dst; dst =3D (void __force *) (info->screen_base + p);
info->screen_base =3D (u8 __force __iomem *)vmem;

We have to use screen_base because of vmalloc'ed memory and deferred io
(fb_deferred_io_page).

> I'm not terribly familiar with this code.  I don't know that this is the
> cleanest approach.  We could also just leave the code alone for now and
> ignore the warning.

Yes, it's best to leave this alone for now.
I'm working on a proposal to provide better layering and minimal coupling
to fbdev. This will hopefully lead to screen_base eventually being used
only twice in the fbtft module and nowhere else.


Regards,
Noralf Tr=F8nnes

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
