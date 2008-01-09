From: Matt Mackall <mpm@selenic.com>
Date: Wed, 09 Jan 2008 20:12:40 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <1199909560.6245.67.camel@cinder.waste.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org>
	 <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
In-Reply-To: <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com


On Tue, 2008-01-08 at 20:58 +0100, Paolo Ciarrocchi wrote:
> On Jan 8, 2008 5:40 PM, Andi Kleen <andi@firstfloor.org> wrote:
> So I cooked up the following patch (probably mangled, just to give you
> a rough idea of what I did):
> diff --git a/arch/arm/common/rtctime.c b/arch/arm/common/rtctime.c
> index bf1075e..19dedb5 100644
> --- a/arch/arm/common/rtctime.c
> +++ b/arch/arm/common/rtctime.c
> @@ -189,13 +189,16 @@ static int rtc_ioctl(struct inode *inode, struct
> file *file, unsigned int cmd,

You'll need to change the prototype, the unlocked version doesn't take
an inode. And you'll need to make sure that nothing in the function uses
the inode, which I think Andi forgot to mention.

> +		if (ret) {
> +			unlock_kernel();
>  			ret = -EFAULT;

This is not a return statement. You only need to unlock before the
actual return.

> -static const struct file_operations rtc_fops = {
> +static long rtc_fioctl(struct file_operations rtc_fops)
> +{
> +	lock_kernel();

Heh.

-- 
Mathematics is the supreme nostalgia of our time.

