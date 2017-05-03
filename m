From: walter harms <wharms@bfs.de>
Date: Wed, 03 May 2017 15:58:25 +0000
Subject: Re: [PATCH] firmware: Google VPD: fix error handling on allocation failures
Message-Id: <5909FE21.7050607@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170503154924.1659-1-colin.king@canonical.com>
In-Reply-To: <20170503154924.1659-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wei-Ning Huang <wnhuang@google.com>, Thierry Escande <thierry.escande@collabora.com>, Wei Yongjun <weiyongjun1@huawei.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 03.05.2017 17:49, schrieb Colin King:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Fix two allocation failure checks. Firstly, ensure info is checked
> for a failed allocation; this fixes a potential null pointer
> dereference issue on info->key.  Secondly, free info is info->key
> fails to allocate to fix a memory leak.
> 
> Detected by CoverityScan, CID#1430064 ("Resource Leak")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/firmware/google/vpd.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/google/vpd.c b/drivers/firmware/google/vpd.c
> index 3ce813110d5e..2eb15b1dabcc 100644
> --- a/drivers/firmware/google/vpd.c
> +++ b/drivers/firmware/google/vpd.c
> @@ -116,9 +116,13 @@ static int vpd_section_attrib_add(const u8 *key, s32 key_len,
>  		return VPD_OK;
>  
>  	info = kzalloc(sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
>  	info->key = kzalloc(key_len + 1, GFP_KERNEL);
> -	if (!info->key)
> +	if (!info->key) {
> +		kfree(info);
>  		return -ENOMEM;
> +	}
>  
>  	memcpy(info->key, key, key_len);
>  


the use of key_len+1 looks like preparing space for a string.
so kstrdup() seems more fitting. If this is not a string
there is also a kmemdup().


re,
 wh

