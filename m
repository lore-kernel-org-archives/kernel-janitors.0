From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 09:40:39 +0000
Subject: Re: [PATCH v4 02/13] exfat: add super block operations
Message-Id: <177371e7-9f52-407c-4f9b-ec9efb15f4a8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052915epcas1p30f42f12990926942d24aa514ebc437ac@epcas1p3.samsung.com>
 <20191121052618.31117-3-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-3-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/super.c
…
> +static int __init init_exfat_fs(void)
> +{
…
> +	err = -ENOMEM;
> +	exfat_inode_cachep = kmem_cache_create("exfat_inode_cache",
> +			sizeof(struct exfat_inode_info),
> +			0, SLAB_RECLAIM_ACCOUNT | SLAB_MEM_SPREAD,
> +			exfat_inode_init_once);
> +	if (!exfat_inode_cachep)
> +		goto shutdown_cache;

Should such an error code assignment be performed only after a failed function call?

Regards,
Markus
