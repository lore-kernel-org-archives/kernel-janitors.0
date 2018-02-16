From: merez@codeaurora.org
Date: Fri, 16 Feb 2018 08:14:28 +0000
Subject: Re: [PATCH][next] wil6210: fix spelling mistake: "preperation"-> "preparation"
Message-Id: <aae1b606d85950d0b2887499c9265370@codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180130192737.8986-1-colin.king@canonical.com>
In-Reply-To: <20180130192737.8986-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-wireless-owner@vger.kernel.org

On 2018-01-30 21:27, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Trivial fix to spelling mistake in debug error message text.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/wireless/ath/wil6210/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/wil6210/main.c
> b/drivers/net/wireless/ath/wil6210/main.c
> index 0c61a6c13991..04c8651274d9 100644
> --- a/drivers/net/wireless/ath/wil6210/main.c
> +++ b/drivers/net/wireless/ath/wil6210/main.c
> @@ -715,7 +715,7 @@ static void wil_bl_prepare_halt(struct wil6210_priv 
> *wil)
>  		    offsetof(struct bl_dedicated_registers_v0,
>  			     boot_loader_struct_version));
>  	if (!tmp) {
> -		wil_dbg_misc(wil, "old BL, skipping halt preperation\n");
> +		wil_dbg_misc(wil, "old BL, skipping halt preparation\n");
>  		return;
>  	}

Reviewed-by: Maya Erez <merez@codeaurora.org>

-- 
Maya Erez
Qualcomm Israel, Inc. on behalf of Qualcomm Innovation Center, Inc.
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a 
Linux Foundation Collaborative Project
