From: Brian Norris <briannorris@chromium.org>
Date: Tue, 29 Jan 2019 18:12:42 +0000
Subject: Re: [PATCH] ath10k: snoc: remove set but not used variable 'ar_snoc'
Message-Id: <CA+ASDXMQto_dqPOuUEX9vqqbWmor8qvpwxBVTg6tSnHkfsCzpw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536200965-121172-1-git-send-email-yuehaibing@huawei.com>
 <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
In-Reply-To: <4b16caf3-9a25-99d0-5b35-f27d6e5a5c65@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Kalle Valo <kvalo@codeaurora.org>

On Mon, Jan 28, 2019 at 9:53 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> ping...

For some reason, your patch shows up as Deferred in patchwork:

https://patchwork.kernel.org/patch/10589789/

So the maintainers have accidentally (?) ignored it. I'm not what the
official suggestion is for that, but you might just resend.

In any case...

> On 2018/9/6 10:29, YueHaibing wrote:
> > From: Yue Haibing <yuehaibing@huawei.com>
> >
> > Fixes gcc '-Wunused-but-set-variable' warning:
> >
> > drivers/net/wireless/ath/ath10k/snoc.c: In function 'ath10k_snoc_tx_pipe_cleanup':
> > drivers/net/wireless/ath/ath10k/snoc.c:681:22: warning:
> >  variable 'ar_snoc' set but not used [-Wunused-but-set-variable]
> >
> > Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

...patch looks fine to me:

Reviewed-by: Brian Norris <briannorris@chromium.org>
