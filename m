From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Mon, 23 Feb 2015 17:06:44 +0000
Subject: Re: [PATCH] [RFC] drivers/staging/fbtft: fix sparse warnings
Message-Id: <CANZNk82SkziecUNCShZu-cjqTHqKCF5UumMazJtNp2upt8qZJg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424468049-24525-1-git-send-email-andrey.krieger.utkin@gmail.com>
	<20150221185824.GE5206@mwanda>
In-Reply-To: <20150221185824.GE5206@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: OSUOSL Drivers <devel@driverdev.osuosl.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-mentors@vger.kernel.org, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, noralf@tronnes.org

2015-02-21 20:58 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Send two separate patches.  You can't "fix" sparse warnings.  You can
> only "fix" bugs.  The rest is add annotation, doing cleanups or possibly
> silencing warnings.

My first email wasn't a patch supposed for accepting, but rather a
request for comments, so I didn't bother with commit granularity,
separation of commit description and the description of my situation
with scissors marker etc. Sorry if this is rude or confusing.


>> diff --git a/drivers/staging/fbtft/fb_agm1264k-fl.c b/drivers/staging/fbtft/fb_agm1264k-fl.c
>> index 9cc7d25..9114239 100644
>> --- a/drivers/staging/fbtft/fb_agm1264k-fl.c
>> +++ b/drivers/staging/fbtft/fb_agm1264k-fl.c
>> @@ -273,7 +273,7 @@ construct_line_bitmap(struct fbtft_par *par, u8 *dest, signed short *src,
>>
>>  static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
>>  {
>> -     u16 *vmem16 = (u16 *)par->info->screen_base;
>> +     u16 __iomem *vmem16 = (u16 __iomem *)par->info->screen_base;
>
> I haven't looked.  What is the type for ->screen_base and why can't it
> be declared as __iomem type?

http://lxr.free-electrons.com/source/include/linux/fb.h#L486
screen_base is component of struct fb_info, defined as "char __iomem *".
In drivers/staging/fbtft/fbtft-core.c, it looks to be actually set to
a pointer resulting from vzalloc().
At https://www.kernel.org/doc/htmldocs/kernel-api/API-vzalloc.html ,
there's no mention of the result being of __iomem nature. So at this
point I'm lost: this looks like inconsistence in driver "by design",
but I don't know enough about this driver. Maybe fbtft driver should
use some another variable in some driver-private structre, and not
screen_base from struct fb_info? Or maybe it should not implicitly
assume that memory allocated by vzalloc() behaves the same way that
properly __iomem-allocated memory? Sorry if my phrases are way too
wrong and sound stupid - please don't let me to die being a fool, give
a comment :)


>>       u8 *buf = par->txbuf.buf;
>>       int x, y;
>>       int ret = 0;
>> @@ -287,7 +287,7 @@ static int write_vmem(struct fbtft_par *par, size_t offset, size_t len)
>>       /* converting to grayscale16 */
>>       for (x = 0; x < par->info->var.xres; ++x)
>>               for (y = 0; y < par->info->var.yres; ++y) {
>> -                     u16 pixel = vmem16[y *  par->info->var.xres + x];
>> +                     u16 pixel = ioread16(vmem16 + y *  par->info->var.xres + x);
>
> You're saying this is a bug in the original code.  Are you positive?
> The changelog should have explained your thinking here.  Same for all
> the iomem changes.

vmem16 is set to a pointer from screen_base, which is _iomem, which
implicates the prohibition of dereferencing. Afrer some brief
searching, I've found that __iomem pointers are supposed to be read
and written with special functions like ioread16(). Also I've read the
fact that at some architectures, simple dereferencing works, but on
others it doesn't.
Of course I'm not sure that exactly this is the correct way to make
sparse happy and to improve correctness of the code (I'm avoiding a
word "to fix" :) ). See above my explanation of condtradiction in this
driver.


-- 
Andrey Utkin
