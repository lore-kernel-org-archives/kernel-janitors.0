From: Eliad Peller <eliad@wizery.com>
Date: Thu, 15 Jan 2015 12:34:42 +0000
Subject: Re: [patch] wlcore: unlock on error in wl1271_op_suspend()
Message-Id: <CAB3XZEdbiOqO-th_1kY8j_95dJKvVKuFAe3XZPj_iJDE8KrPog@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150115114340.GC17976@mwanda>
In-Reply-To: <20150115114340.GC17976@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, Ram Amrani <ramrani@ti.com>, "John W. Linville" <linville@tuxdriver.com>, Arik Nemtsov <arik@wizery.com>, Johannes Berg <johannes.berg@intel.com>, David Spinadel <david.spinadel@intel.com>, Luciano Coelho <luciano.coelho@intel.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jan 15, 2015 at 1:43 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We recently introduced a new error path which needs an unlock.
>
> Fixes: 6d5a748d4836 ('wlcore: add ability to reduce FW interrupts during suspend')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker fix.  It's possible that wl1271_ps_elp_wakeup() unlocks
> on error but I didn't see it, and that would be an ugly API.
>
> diff --git a/drivers/net/wireless/ti/wlcore/main.c b/drivers/net/wireless/ti/wlcore/main.c
> index e90fb78..02f0e86 100644
> --- a/drivers/net/wireless/ti/wlcore/main.c
> +++ b/drivers/net/wireless/ti/wlcore/main.c
> @@ -1785,8 +1785,10 @@ static int wl1271_op_suspend(struct ieee80211_hw *hw,
>         mutex_lock(&wl->mutex);
>
>         ret = wl1271_ps_elp_wakeup(wl);
> -       if (ret < 0)
> +       if (ret < 0) {
> +               mutex_unlock(&wl->mutex);
>                 return ret;
> +       }
>
The patch is correct, thanks.
If you'll take a look at other functions in the file, you'll usually
see "goto out_unlock" (or something similar) in this case.

Eliad.
