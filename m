From: Arend van Spriel <arend.vanspriel@broadcom.com>
Date: Sun, 11 Mar 2018 23:00:27 +0000
Subject: Re: [PATCH 3/3] wlcore: Use common error handling code in wl1271_acx_sta_rate_policies()
Message-Id: <5AA5B50B.6000101@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <b5db0825-394a-1d6d-351a-43be14e4c6b4@users.sourceforge.net>
 <7d5cc7b4-f0ce-192a-3e5e-c2944c1e3e3d@users.sourceforge.net>
In-Reply-To: <7d5cc7b4-f0ce-192a-3e5e-c2944c1e3e3d@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Colin Ian King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 3/10/2018 10:33 PM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 10 Mar 2018 22:18:45 +0100
>
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.

You call this an issue?

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   drivers/net/wireless/ti/wlcore/acx.c | 24 +++++++++++-------------
>   1 file changed, 11 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/wireless/ti/wlcore/acx.c b/drivers/net/wireless/ti/wlcore/acx.c
> index 1cc5bba670e1..7d37a417c756 100644
> --- a/drivers/net/wireless/ti/wlcore/acx.c
> +++ b/drivers/net/wireless/ti/wlcore/acx.c

[...]

>   	ret = wl1271_cmd_configure(wl, ACX_RATE_POLICY, acx, sizeof(*acx));
> -	if (ret < 0) {
> -		wl1271_warning("Setting of rate policies failed: %d", ret);
> -		goto out;
> -	}
> +	if (ret < 0)
> +		goto report_failure;
>
> -out:
> +free_acx:
>   	kfree(acx);
>   	return ret;
> +
> +report_failure:
> +	wl1271_warning("Setting of rate policies failed: %d", ret);
> +	goto free_acx;

In my opinion you are introducing a new issue. I don't call this 
"common" in any way. It is leaning more towards "spaghetti code" [1]. 
Jumping over a label to return to it with another jump. They are not 
long jumps, but it sure does not make thing more readable. Always aim 
for simple top-to-bottom.

Regards,
Arend

[1] https://en.wikipedia.org/wiki/Spaghetti_code

>   }
>
>   int wl1271_acx_ap_rate_policy(struct wl1271 *wl, struct conf_tx_rate_class *c,
>

