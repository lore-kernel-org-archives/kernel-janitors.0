From: Pavel Machek <pavel@ucw.cz>
Date: Fri, 11 Jan 2008 08:33:45 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080111083345.GA3863@ucw.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
In-Reply-To: <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com


> Hi Andi,
> I grepped and tried to do what you suggested.
> The first file that git grep reported was:
> arch/arm/common/rtctime.c:static const struct file_operations rtc_fops = {
> 
> So I cooked up the following patch (probably mangled, just to give you
> a rough idea of what I did):
> diff --git a/arch/arm/common/rtctime.c b/arch/arm/common/rtctime.c
> index bf1075e..19dedb5 100644
> --- a/arch/arm/common/rtctime.c
> +++ b/arch/arm/common/rtctime.c
> @@ -189,13 +189,16 @@ static int rtc_ioctl(struct inode *inode, struct
> file *file, unsigned int cmd,
>  		if (ret)
>  			break;
>  		ret = copy_to_user(uarg, &alrm.time, sizeof(tm));
> -		if (ret)
> +		if (ret) {
> +			unlock_kernel();
>  			ret = -EFAULT;
> +		}
>  		break;

Just put unlock kernel near return ret;...

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
