From: Luca Tettamanti <kronos.it@gmail.com>
Date: Thu, 05 Aug 2010 20:51:12 +0000
Subject: Re: [PATCH 42/42] drivers/media/video/bt8xx: Adjust confusing if
Message-Id: <AANLkTi=YauQBWyZnGpuBtQpNq=Re8WUXY9mH6FSFMP+7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052229390.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052229390.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi,
one minor comment:

On Thu, Aug 5, 2010 at 10:29 PM, Julia Lawall <julia@diku.dk> wrote:
> From: Julia Lawall <julia@diku.dk>
>
> Indent the branch of an if.
[...]
> diff --git a/drivers/media/video/bt8xx/bttv-i2c.c b/drivers/media/video/bt8xx/bttv-i2c.c
> index 685d659..695765c 100644
> --- a/drivers/media/video/bt8xx/bttv-i2c.c
> +++ b/drivers/media/video/bt8xx/bttv-i2c.c
> @@ -123,7 +123,7 @@ bttv_i2c_wait_done(struct bttv *btv)
>        if (wait_event_interruptible_timeout(btv->i2c_queue,
>                btv->i2c_done, msecs_to_jiffies(85)) = -ERESTARTSYS)
>
> -       rc = -EIO;
> +               rc = -EIO;

I'd also remove the empty line before the indented statement, it's confusing...

Luca
