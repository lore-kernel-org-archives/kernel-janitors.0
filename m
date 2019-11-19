From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 15:06:17 +0000
Subject: Re: [PATCH v3 10/13] exfat: add nls operations
Message-Id: <705cb02b-7707-af52-c2b5-70660debc619@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094026epcas1p3eea5c655f3b89383e02c0097c491f0bc@epcas1p3.samsung.com>
 <20191119093718.3501-11-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-11-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/nls.c
…
> +static int exfat_load_upcase_table(struct super_block *sb,
> +		sector_t sector, unsigned long long num_sectors,
> +		unsigned int utbl_checksum)
> +{
…
> +error:
> +	if (bh)
> +		brelse(bh);

I am informed in the way that this function tolerates the passing
of null pointers.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/buffer_head.h?id=af42d3466bdc8f39806b26f593604fdc54140bcb#n292
https://elixir.bootlin.com/linux/v5.4-rc8/source/include/linux/buffer_head.h#L292

Thus I suggest to omit the extra pointer check also at similar places.

Can the label “release_bh” be more helpful?

Regards,
Markus
