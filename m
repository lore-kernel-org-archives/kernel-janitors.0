From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 14:10:10 +0000
Subject: Re: [PATCH v4 06/13] exfat: add exfat entry operations
Message-Id: <bf2e73f2-08b3-5221-2702-524ba6a07497@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052918epcas1p284be629c57ced93afe88b94a35437cb2@epcas1p2.samsung.com>
 <20191121052618.31117-7-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-7-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/fatent.c
…
> +int exfat_free_cluster(struct inode *inode, struct exfat_chain *p_chain)
> +{
…
> +out:
> +	sbi->used_clusters -= num_clusters;

Can a label like “decrement_counter” be more helpful?


…
> +int exfat_mirror_bh(struct super_block *sb, sector_t sec,
> +		struct buffer_head *bh)
> +{
…
> +		if (!c_bh) {
> +			err = -ENOMEM;
> +			goto out;
> +		}

Can it be nicer to return directly?

…
> +out:
> +	return err;
> +}

Would you like to omit such a label for this function implementation?

Regards,
Markus
