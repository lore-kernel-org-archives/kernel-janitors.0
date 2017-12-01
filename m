From: Joe Perches <joe@perches.com>
Date: Fri, 01 Dec 2017 09:42:17 +0000
Subject: Re: [PATCH] wlcore, wl1251: fix spelling mistake: "Couldnt" -> "Couldn't"
Message-Id: <1512121337.19952.154.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171201093433.9154-1-colin.king@canonical.com>
In-Reply-To: <20171201093433.9154-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2017-12-01 at 09:34 +0000, Colin King wrote:
> Trivial fix to spelling mistake in error message text.
[]
> diff --git a/drivers/net/wireless/ti/wl1251/init.c b/drivers/net/wireless/ti/wl1251/init.c
[]
> @@ -311,7 +311,7 @@ static int wl1251_hw_init_data_path_config(struct wl1251 *wl)
>  	wl->data_path = kzalloc(sizeof(struct acx_data_path_params_resp),
>  				GFP_KERNEL);
>  	if (!wl->data_path) {
> -		wl1251_error("Couldnt allocate data path parameters");
> +		wl1251_error("Couldn't allocate data path parameters");

Might be better to remove this one.

