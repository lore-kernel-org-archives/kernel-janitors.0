From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 08:09:10 +0000
Subject: Re: [PATCH v4 10/13] exfat: add nls operations
Message-Id: <df089831-038c-3b39-6ec7-684d1f698756@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052920epcas1p3e5b6c0251e869e265d19798dbeebab4e@epcas1p3.samsung.com>
 <20191121052618.31117-11-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-11-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/nls.c
…
> +static int exfat_load_upcase_table(struct super_block *sb,
> +		sector_t sector, unsigned long long num_sectors,
> +		unsigned int utbl_checksum)
> +{
…
> +	int ret = -EIO;
…
> +	while (sector < num_sectors) {
> +		bh = sb_bread(sb, sector);
> +		if (!bh) {
> +			exfat_msg(sb, KERN_ERR,
> +				"failed to read sector(0x%llx)\n", sector);
> +			goto release_bh;
> +		}
…
> +	}
> +
> +	if (index >= 0xFFFF && utbl_checksum == checksum) {
> +		brelse(bh);
> +		return 0;
> +	}
> +
> +	exfat_msg(sb, KERN_ERR,
> +			"failed to load upcase table (idx : 0x%08x, chksum : 0x%08x, utbl_chksum : 0x%08x)\n",
> +			index, checksum, utbl_checksum);
> +
> +	ret = -EINVAL;

Can a blank line be omitted between the message and the error code?


> +release_bh:
> +	brelse(bh);
> +	exfat_free_upcase_table(sb);
> +	return ret;
> +}

I got the impression that the resource management is still questionable
for this function implementation.

1. Now I suggest to move the call of the function “brelse” to the end
   of the while loop. The label “release_bh” would be renamed to “free_table” then.

2. Can a variable initialisation be converted to the assignment “ret = -EIO;”
   in an if branch?

Regards,
Markus
