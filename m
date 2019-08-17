From: Marek Behun <marek.behun@nic.cz>
Date: Sat, 17 Aug 2019 00:04:34 +0000
Subject: Re: [PATCH][next] bus: moxtet: fix unsigned comparison to less than zero
Message-Id: <20190817020434.4ef2dc5f@nic.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190816224106.11583-1-colin.king@canonical.com>
In-Reply-To: <20190816224106.11583-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 16 Aug 2019 23:41:06 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the size_t variable res is being checked for
> an error failure however the unsigned variable is never
> less than zero so this test is always false. Fix this by
> making variable res ssize_t
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 5bc7f990cd98 ("bus: Add support for Moxtet bus")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/bus/moxtet.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/moxtet.c b/drivers/bus/moxtet.c
> index 1ee4570e7e17..288a9e4c6c7b 100644
> --- a/drivers/bus/moxtet.c
> +++ b/drivers/bus/moxtet.c
> @@ -514,7 +514,7 @@ static ssize_t output_write(struct file *file, const char __user *buf,
>  	struct moxtet *moxtet = file->private_data;
>  	u8 bin[TURRIS_MOX_MAX_MODULES];
>  	u8 hex[sizeof(bin) * 2 + 1];
> -	size_t res;
> +	ssize_t res;
>  	loff_t dummy = 0;
>  	int err, i;
>  

Hi Colin,
thanks. Should I just Ack this, or do I need to send patch to the
developer who commited my patches?
Thanks.

Marek
