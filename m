From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2015 16:51:32 +0000
Subject: Re: [PATCH 01/16] Clean up unnecessary void* pointer cast.
Message-Id: <20150422165132.GS16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429720530-20044-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429720530-20044-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The subject need to be written by hand and they need to be unique.

git log --oneline driver/file.c
Copy and paste the patch prefix for each email you send.

On Thu, Apr 23, 2015 at 12:35:15AM +0800, Firo Yang wrote:
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  sound/pci/emu10k1/emufx.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
> index 56fc47b..8a39a6f 100644
> --- a/sound/pci/emu10k1/emufx.c
> +++ b/sound/pci/emu10k1/emufx.c
> @@ -1186,8 +1186,8 @@ static int _snd_emu10k1_audigy_init_efx(struct snd_emu10k1 *emu)
>  	if (!icode)
>  		return err;
>  
> -	icode->gpr_map = (u_int32_t __user *) kcalloc(512 + 256 + 256 + 2 * 1024,
> -						      sizeof(u_int32_t), GFP_KERNEL);

This cast is special.  It's a Sparse thing.  Since I know you have
Smatch installed you can do

	~/path/to/smatch/smatch_scripts/kchecker --sparse sound/pci/emu10k1/emufx.c

I'm not positive if you need a __force in there?

Anyway, don't remove this.

regards,
dan carpenter
