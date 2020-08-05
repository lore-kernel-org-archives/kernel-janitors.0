From: Randy Dunlap <rdunlap@infradead.org>
Date: Wed, 05 Aug 2020 14:30:22 +0000
Subject: Re: [PATCH][next] staging: wfx: fix a handful of spelling mistakes
Message-Id: <049d06fd-0ccb-38ae-e077-4cbbd742cea0@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200805142317.23845-1-colin.king@canonical.com>
In-Reply-To: <20200805142317.23845-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 8/5/20 7:23 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There are various spelling mistakes in comments and error messages.
> Fix these.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/staging/wfx/data_rx.c | 2 +-
>  drivers/staging/wfx/data_tx.c | 2 +-
>  drivers/staging/wfx/debug.c   | 4 ++--
>  drivers/staging/wfx/hif_rx.c  | 2 +-
>  drivers/staging/wfx/hif_tx.c  | 4 ++--
>  drivers/staging/wfx/main.c    | 2 +-
>  drivers/staging/wfx/main.h    | 2 +-
>  drivers/staging/wfx/sta.c     | 2 +-
>  8 files changed, 10 insertions(+), 10 deletions(-)
> 

> diff --git a/drivers/staging/wfx/debug.c b/drivers/staging/wfx/debug.c
> index 3f1712b7c919..e396f18747d1 100644
> --- a/drivers/staging/wfx/debug.c
> +++ b/drivers/staging/wfx/debug.c
> @@ -299,7 +299,7 @@ static ssize_t wfx_send_hif_msg_read(struct file *file, char __user *user_buf,
>  		return ret;
>  	if (context->ret < 0)
>  		return context->ret;
> -	// Be carefull, write() is waiting for a full message while read()
> +	// Be careful, write() is waiting for a full message while read()
>  	// only return a payload

	   only returns a payload

>  	if (copy_to_user(user_buf, context->reply, count))
>  		return -EFAULT;

> diff --git a/drivers/staging/wfx/hif_tx.c b/drivers/staging/wfx/hif_tx.c
> index 5110f9b93762..11fbdb5fcecc 100644
> --- a/drivers/staging/wfx/hif_tx.c
> +++ b/drivers/staging/wfx/hif_tx.c
> @@ -125,7 +125,7 @@ int wfx_cmd_send(struct wfx_dev *wdev, struct hif_msg *request,
>  
>  // This function is special. After HIF_REQ_ID_SHUT_DOWN, chip won't reply to any
>  // request anymore. We need to slightly hack struct wfx_hif_cmd for that job. Be
> -// carefull to only call this funcion during device unregister.
> +// carefull to only call this function during device unregister.

      careful

>  int hif_shutdown(struct wfx_dev *wdev)
>  {
>  	int ret;

> diff --git a/drivers/staging/wfx/main.h b/drivers/staging/wfx/main.h
> index c59d375dd3ad..63138777e72a 100644
> --- a/drivers/staging/wfx/main.h
> +++ b/drivers/staging/wfx/main.h
> @@ -19,7 +19,7 @@ struct wfx_dev;
>  struct hwbus_ops;
>  
>  struct wfx_platform_data {
> -	/* Keyset and ".sec" extention will appended to this string */
> +	/* Keyset and ".sec" extension will appended to this string */

	                               will be appended


>  	const char *file_fw;
>  	const char *file_pds;
>  	struct gpio_desc *gpio_wakeup;


-- 
~Randy
