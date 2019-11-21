From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 10:40:28 +0000
Subject: Re: [PATCH v4 03/13] exfat: add inode operations
Message-Id: <38716ae8-a056-4ee3-285a-a3c1ac8307a5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052916epcas1p3f00c8e510eb53f53f4e082848bd325d0@epcas1p3.samsung.com>
 <20191121052618.31117-4-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-4-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/inode.c
…
> +static int exfat_bmap(struct inode *inode, sector_t sector, sector_t *phys,
> +		unsigned long *mapped_blocks, int *create)
> +{
…
> +	err = exfat_map_cluster(inode, clu_offset, &cluster,
> +		*create & BMAP_ADD_CLUSTER);

I find an other indentation more appropriate.
Please align the last parameter below (or besides) the opening parenthesis.


> +	if (err) {
> +		if (err != -ENOSPC)
> +			return -EIO;
> +		return err;
> +	}

Can such source code become more succinct?

+	if (err)
+		return err != -ENOSPC ? -EIO : err;

Regards,
Markus
