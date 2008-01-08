From: Rik van Riel <riel@redhat.com>
Date: Tue, 08 Jan 2008 20:22:45 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080108152245.3a8b415f@bree.surriel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org>
	<4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
In-Reply-To: <4d8e3fd30801081158j3e7292d0i939776342015b12d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paolo Ciarrocchi <paolo.ciarrocchi@gmail.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, gorcunov@gmail.com

On Tue, 8 Jan 2008 20:58:04 +0100
"Paolo Ciarrocchi" <paolo.ciarrocchi@gmail.com> wrote:

> -static const struct file_operations rtc_fops = {
> +static long rtc_fioctl(struct file_operations rtc_fops)
> +{
> +	lock_kernel();
>  	.owner		= THIS_MODULE,
>  	.llseek		= no_llseek,
>  	.read		= rtc_read,
>  	.poll		= rtc_poll,
> -	.ioctl		= rtc_ioctl,
> +	.unlocked_ioctl	= rtc_ioctl,
>  	.open		= rtc_open,
>  	.release	= rtc_release,
>  	.fasync		= rtc_fasync,
> +	unlock_kernel();
>  };

This is a struct with function pointers, not a function.

No wonder it doesn't compile after you tried turning it into one :)

-- 
All rights reversed.
