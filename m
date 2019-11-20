From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 20 Nov 2019 20:38:05 +0000
Subject: Re: [PATCH v3 07/13] exfat: add bitmap operations
Message-Id: <7436291c-4e74-adcb-b421-56d49c90fa5e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094024epcas1p3991c5d94c2cf40388d64c0bd9c30092d@epcas1p3.samsung.com>
 <20191119093718.3501-8-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-8-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/balloc.c
…
> +int exfat_load_bitmap(struct super_block *sb)
> +{
…
> +	struct exfat_dentry *ep = NULL;
…
> +	while (clu.dir != EOF_CLUSTER) {
> +		for (i = 0; i < sbi->dentries_per_clu; i++) {
> +			ep = exfat_get_dentry(sb, &clu, i, &bh, NULL);
> +			if (!ep)
> +				return -EIO;
…

How do you think about to move the definition for the variable “ep”
to the beginning of the for loop so that the extra pointer initialisation
can be omitted?

Regards,
Markus
