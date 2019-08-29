From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 29 Aug 2019 15:44:59 +0000
Subject: Re: [PATCH] staging: exfat: add exfat filesystem code to staging
Message-Id: <d5c289ef-6c5c-ecdc-0e73-c5bd410b3d26@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190828160817.6250-1-gregkh@linuxfoundation.org>
In-Reply-To: <20190828160817.6250-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, linux-fsdevel@vger.kernel.org, Sasha Levin <alexander.levin@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> +++ b/drivers/staging/exfat/exfat_core.c
> @@ -0,0 +1,3704 @@
…
> +static s32 __load_upcase_table(struct super_block *sb, sector_t sector,
> +			       u32 num_sectors, u32 utbl_checksum)
> +{
…
> +error:

An other label would be nicer, wouldn't it?


> +	if (tmp_bh)
> +		brelse(tmp_bh);

This inline function tolerates the passing of null pointers.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/buffer_head.h?id=9cf6b756cdf2cd38b8b0dac2567f7c6daf5e79d5#n292
https://elixir.bootlin.com/linux/v5.3-rc6/source/include/linux/buffer_head.h#L292

Thus I suggest to omit the extra pointer check at affected places.


> +++ b/drivers/staging/exfat/exfat_super.c
> @@ -0,0 +1,4137 @@
…
> +// FIXME use commented lines
> +// static int exfat_default_codepage = CONFIG_EXFAT_DEFAULT_CODEPAGE;

Is such information still relevant anyhow?


> +static int exfat_fill_super(struct super_block *sb, void *data, int silent)
> +{
…
> +out_fail:
> +	if (root_inode)
> +		iput(root_inode);

I am informed in the way that this function tolerates the passing
of null pointers.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/inode.c?id=9cf6b756cdf2cd38b8b0dac2567f7c6daf5e79d5#n1564
https://elixir.bootlin.com/linux/v5.3-rc6/source/fs/inode.c#L1564

Thus I suggest to omit the extra pointer check also at this place.

Regards,
Markus
