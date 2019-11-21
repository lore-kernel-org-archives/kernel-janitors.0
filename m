From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 13:45:11 +0000
Subject: Re: [PATCH v4 05/13] exfat: add file operations
Message-Id: <e648740d-1bf0-21f6-7073-f66e0947cc58@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052917epcas1p1f81875dcc2d1a64dc3420bedc68fb3ba@epcas1p1.samsung.com>
 <20191121052618.31117-6-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-6-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/file.c
…
> +void exfat_truncate(struct inode *inode, loff_t size)
> +{
…
> +out:
> +	aligned_size = i_size_read(inode);

Can a label like “read_size” be more helpful?

Regards,
Markus
