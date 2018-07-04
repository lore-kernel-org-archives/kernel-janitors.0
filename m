From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 04 Jul 2018 15:55:10 +0000
Subject: Re: [PATCH] Input: cros_ec_keyb: remove redundant variable num_cols
Message-Id: <20180704155510.b7q2zy4zehwumngc@penguin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702162841.12553-1-colin.king@canonical.com>
In-Reply-To: <20180702162841.12553-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Ravi Chandra Sadineni <ravisadineni@chromium.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jul 02, 2018 at 05:28:41PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable num_cols is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable ‘num_cols’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thank you.

> ---
>  drivers/input/keyboard/cros_ec_keyb.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/input/keyboard/cros_ec_keyb.c b/drivers/input/keyboard/cros_ec_keyb.c
> index 820bebad519a..81be6f781f0b 100644
> --- a/drivers/input/keyboard/cros_ec_keyb.c
> +++ b/drivers/input/keyboard/cros_ec_keyb.c
> @@ -160,9 +160,6 @@ static void cros_ec_keyb_process(struct cros_ec_keyb *ckdev,
>  	int col, row;
>  	int new_state;
>  	int old_state;
> -	int num_cols;
> -
> -	num_cols = len;
>  
>  	if (ckdev->ghost_filter && cros_ec_keyb_has_ghosting(ckdev, kb_state)) {
>  		/*
> -- 
> 2.17.1
> 

-- 
Dmitry
