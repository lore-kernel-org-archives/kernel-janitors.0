From: Andrew Morton <akpm@linux-foundation.org>
Date: Tue, 21 Sep 2010 22:20:31 +0000
Subject: Re: [PATCH 04/14] memstick: core: fix device_register() error
Message-Id: <20100921152031.30365b3f.akpm@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284900889-24369-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284900889-24369-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, Jiri Slaby <jirislaby@gmail.com>, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>

On Sun, 19 Sep 2010 16:54:49 +0400
Vasiliy Kulikov <segooon@gmail.com> wrote:

> If device_register() fails then call put_device().
> See comment to device_register.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
> ---
>  compile tested.
> 
>  drivers/memstick/core/memstick.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/memstick/core/memstick.c b/drivers/memstick/core/memstick.c
> index c00fe82..4303b7e 100644
> --- a/drivers/memstick/core/memstick.c
> +++ b/drivers/memstick/core/memstick.c
> @@ -465,6 +465,7 @@ static void memstick_check(struct work_struct *work)
>  		if (!host->card) {
>  			host->card = card;
>  			if (device_register(&card->dev)) {
> +				put_device(&card->dev);
>  				kfree(host->card);
>  				host->card = NULL;
>  			}

A failed device_register() takes a bogus ref on the not-registered
device?  It's no surprise that people are getting this wrong.  

The principle of least surprise says: fix device_register()!
