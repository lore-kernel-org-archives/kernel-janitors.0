From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Wed, 31 Jan 2018 12:57:34 +0000
Subject: Re: [PATCH] ocxl: fix signed comparison with less than zero
Message-Id: <af638e7d-0bdd-1c2a-571f-cb30085e408a@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180130151144.32544-1-colin.king@canonical.com>
In-Reply-To: <20180130151144.32544-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Le 30/01/2018 à 16:11, Colin King a écrit :
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the comparison of used < 0 is always false because
> uses is a size_t. Fix this by making used a ssize_t type.
> 
> Detected by Coccinelle:
> drivers/misc/ocxl/file.c:320:6-10: WARNING: Unsigned expression
> compared with zero: used < 0
> 
> Fixes: 5ef3166e8a32 ("ocxl: Driver code for 'generic' opencapi devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

>   drivers/misc/ocxl/file.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index c90c1a578d2f..1287e4430e6b 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -277,7 +277,7 @@ static ssize_t afu_read(struct file *file, char __user *buf, size_t count,
>   	struct ocxl_context *ctx = file->private_data;
>   	struct ocxl_kernel_event_header header;
>   	ssize_t rc;
> -	size_t used = 0;
> +	ssize_t used = 0;
>   	DEFINE_WAIT(event_wait);
> 
>   	memset(&header, 0, sizeof(header));
> 

