From: Randy Dunlap <rdunlap@infradead.org>
Date: Thu, 06 Aug 2020 14:16:08 +0000
Subject: Re: [PATCH][next][V2] staging: wfx: fix a handful of spelling mistakes
Message-Id: <1d822037-d8f8-cbac-6df2-fe7296ad4d32@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200806104701.46123-1-colin.king@canonical.com>
In-Reply-To: <20200806104701.46123-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/6/20 3:47 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are various spelling mistakes in comments and error messages.
> Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: add in some more fixes as spotted by Randy Dunlap
> 
> ---
>  drivers/staging/wfx/data_rx.c | 2 +-
>  drivers/staging/wfx/data_tx.c | 2 +-
>  drivers/staging/wfx/debug.c   | 6 +++---
>  drivers/staging/wfx/hif_rx.c  | 2 +-
>  drivers/staging/wfx/hif_tx.c  | 4 ++--
>  drivers/staging/wfx/main.c    | 2 +-
>  drivers/staging/wfx/main.h    | 2 +-
>  drivers/staging/wfx/sta.c     | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)

> diff --git a/drivers/staging/wfx/main.c b/drivers/staging/wfx/main.c
> index 11dfa088fc86..4263f912760b 100644
> --- a/drivers/staging/wfx/main.c
> +++ b/drivers/staging/wfx/main.c
> @@ -384,7 +384,7 @@ int wfx_probe(struct wfx_dev *wdev)
>  	err = wfx_sl_init(wdev);
>  	if (err && wdev->hw_caps.capabilities.link_mode = SEC_LINK_ENFORCED) {
>  		dev_err(wdev->dev,
> -			"chip require secure_link, but can't negociate it\n");
> +			"chip require secure_link, but can't negotiate it\n");

			      requires

>  		goto err0;
>  	}

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
