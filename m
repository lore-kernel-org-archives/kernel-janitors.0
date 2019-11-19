From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 14:19:01 +0000
Subject: Re: [PATCH v3 06/13] exfat: add exfat entry operations
Message-Id: <e427d4ad-aaa0-1d96-3aab-01be7703dd77@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094023epcas1p4976d19f4b9a859ba4bd5b3068cafa88a@epcas1p4.samsung.com>
 <20191119093718.3501-7-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-7-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/fatent.c
…
> +int exfat_zeroed_cluster(struct inode *dir, unsigned int clu)
> +{
…
> +error:
> +	exfat_msg(sb, KERN_ERR, "failed zeroed sect %llu\n",
> +		(unsigned long long)blknr);
…

Can the label “report_failure” be more helpful?


…
> +int exfat_alloc_cluster(struct inode *inode, unsigned int num_alloc,
> +		struct exfat_chain *p_chain)
> +{
…
> +error:
> +	if (num_clusters)
> +		exfat_free_cluster(inode, p_chain);

Can a label like “check_num_clusters” be nicer?

Regards,
Markus
