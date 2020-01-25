From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Date: Sat, 25 Jan 2020 09:29:30 +0000
Subject: Re: [PATCH] fs/adfs: bigdir: Fix an error code in adfs_fplus_read()
Message-Id: <20200125092930.GQ25745@shell.armlinux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200124101537.z6n242eovocfbdha@kili.mountain>
In-Reply-To: <20200124101537.z6n242eovocfbdha@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Kate Stewart <kstewart@linuxfoundation.org>, Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 24, 2020 at 01:15:37PM +0300, Dan Carpenter wrote:
> This code accidentally returns success, but it should return the
> -EIO error code from adfs_fplus_validate_header().
> 
> Fixes: d79288b4f61b ("fs/adfs: bigdir: calculate and validate directory checkbyte")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch.

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

Al, please apply, thanks.

> ---
>  fs/adfs/dir_fplus.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
> index 48ea299b6ece..4a15924014da 100644
> --- a/fs/adfs/dir_fplus.c
> +++ b/fs/adfs/dir_fplus.c
> @@ -114,7 +114,8 @@ static int adfs_fplus_read(struct super_block *sb, u32 indaddr,
>  		return ret;
>  
>  	dir->bighead = h = (void *)dir->bhs[0]->b_data;
> -	if (adfs_fplus_validate_header(h)) {
> +	ret = adfs_fplus_validate_header(h);
> +	if (ret) {
>  		adfs_error(sb, "dir %06x has malformed header", indaddr);
>  		goto out;
>  	}
> -- 
> 2.11.0
> 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
