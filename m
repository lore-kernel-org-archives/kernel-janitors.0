From: Nicolas Pitre <nico@fluxnic.net>
Date: Thu, 26 Nov 2020 22:27:32 +0000
Subject: Re: [PATCH] cramfs: Kconfig: Fix spelling mistake "adresssed" -> "addressed"
Message-Id: <64s43648-2182-3n94-5ssr-9943o794r97q@syhkavp.arg>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201126222405.12772-1-colin.king@canonical.com>
In-Reply-To: <20201126222405.12772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 26 Nov 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Nicolas Pitre <nico@fluxnic.net>


> ---
>  fs/cramfs/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cramfs/Kconfig b/fs/cramfs/Kconfig
> index d98cef0dbb6b..a8af8c6ac15d 100644
> --- a/fs/cramfs/Kconfig
> +++ b/fs/cramfs/Kconfig
> @@ -38,7 +38,7 @@ config CRAMFS_MTD
>  	default y if !CRAMFS_BLOCKDEV
>  	help
>  	  This option allows the CramFs driver to load data directly from
> -	  a linear adressed memory range (usually non volatile memory
> +	  a linear addressed memory range (usually non volatile memory
>  	  like flash) instead of going through the block device layer.
>  	  This saves some memory since no intermediate buffering is
>  	  necessary.
> -- 
> 2.29.2
> 
> 
