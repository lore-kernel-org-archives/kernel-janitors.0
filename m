From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Nov 2019 14:15:44 +0000
Subject: Re: [PATCH 03/13] exfat: add inode operations
Message-Id: <82520012-9940-7f2b-3bac-bea5c2396ccd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-4-namjae.jeon@samsung.com>
In-Reply-To: <20191113081800.7672-4-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/inode.c
…
> +static int exfat_create(struct inode *dir, struct dentry *dentry, umode_t mode,
> +		bool excl)
> +{
…
+out:
+	mutex_unlock(&EXFAT_SB(sb)->s_lock);

Can the label “unlock” be more appropriate?


> +static struct dentry *exfat_lookup(struct inode *dir, struct dentry *dentry,
> +		unsigned int flags)
> +{
…
> +error:
> +	mutex_unlock(&EXFAT_SB(sb)->s_lock);

Would you like to use the label “unlock” also at this place (and similar ones)?


> +static int exfat_search_empty_slot(struct super_block *sb,
> +		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
> +		int num_entries)
> +{
…
> +out:
> +	kfree(clu);

How do you think about to rename the label to “free_clu”?

Regards,
Markus
