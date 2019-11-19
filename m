From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 14:40:17 +0000
Subject: Re: [PATCH v3 08/13] exfat: add exfat cache
Message-Id: <c1db28a9-7905-be5e-68fa-21e23400b4a5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094024epcas1p1be385d521ef64ae0e62da3f6f9bf3401@epcas1p1.samsung.com>
 <20191119093718.3501-9-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-9-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/cache.c
…
> +static void exfat_cache_add(struct inode *inode,
> +		struct exfat_cache_id *new)
> +{
…
> +out:
> +	spin_unlock(&ei->cache_lru_lock);
…

Can the label “unlock” be more helpful?

Regards,
Markus
