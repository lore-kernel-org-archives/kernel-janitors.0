From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 14:09:54 +0000
Subject: Re: [PATCH] input: ims-pcu: remove redundant assignment to variable 'error'
Message-Id: <20200603140953.GL30374@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603135102.130436-1-colin.king@canonical.com>
In-Reply-To: <20200603135102.130436-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jun 03, 2020 at 02:51:02PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable error is being initialized with a value that is
> never read and the -ENOMEM error return is being returned anyhow
> by the error exit path to label err_free_mem.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/input/misc/ims-pcu.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
> index d8dbfc030d0f..4ba68aa3d281 100644
> --- a/drivers/input/misc/ims-pcu.c
> +++ b/drivers/input/misc/ims-pcu.c
> @@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>  	if (!gamepad || !input) {
>  		dev_err(pcu->dev,
>  			"Not enough memory for gamepad device\n");
> -		error = -ENOMEM;
>  		goto err_free_mem;

It would be better to change the return instead.

regards,
dan carpenter
