From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Nov 2019 15:01:11 +0000
Subject: Re: [PATCH 07/13] exfat: add bitmap operations
Message-Id: <bb89f610-3eac-6b28-1aff-265b358d22af@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-8-namjae.jeon@samsung.com>
In-Reply-To: <20191113081800.7672-8-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/balloc.c
…
+int exfat_count_used_clusters(struct super_block *sb, unsigned int *ret_count)
+{
…
+	/* FIXME : abnormal bitmap count should be handled as more smart */
+	if (total_clus < count)
+		count = total_clus;

Would you like to improve any implementation details according to this comment?

Regards,
Markus
