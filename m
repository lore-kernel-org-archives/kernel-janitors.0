From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Mon, 18 Nov 2019 05:05:21 +0000
Subject: RE: [PATCH 07/13] exfat: add bitmap operations
Message-Id: <00bd01d59dcd$c72058a0$556109e0$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-8-namjae.jeon@samsung.com>
        <CGME20191117150120epcas4p4c9229bc184f0a299f0c7215dd473ae0a@epcas4p4.samsung.com>
        <bb89f610-3eac-6b28-1aff-265b358d22af@web.de>
In-Reply-To: <bb89f610-3eac-6b28-1aff-265b358d22af@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> …
> > +++ b/fs/exfat/balloc.c
> …
> +int exfat_count_used_clusters(struct super_block *sb, unsigned int
> *ret_count)
> +{
> …
> +	/* FIXME : abnormal bitmap count should be handled as more smart */
> +	if (total_clus < count)
> +		count = total_clus;
> 
> Would you like to improve any implementation details according to this
> comment?
Yes, Will improve it on V2.

Thanks!
> 
> Regards,
> Markus
