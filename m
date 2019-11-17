From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 17 Nov 2019 13:30:22 +0000
Subject: Re: [PATCH 02/13] exfat: add super block operations
Message-Id: <9e9bac40-109c-3349-24da-532c540638c2@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-3-namjae.jeon@samsung.com>
In-Reply-To: <20191113081800.7672-3-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/super.c
…
> +static int exfat_show_options(struct seq_file *m, struct dentry *root)
> +{
…
> +	seq_printf(m, ",fmask=%04o", opts->fs_fmask);
> +	seq_printf(m, ",dmask=%04o", opts->fs_dmask);

How do you think about to combine these two function calls into a single one?


> +static int __exfat_fill_super(struct super_block *sb)
> +{
…
> +		exfat_msg(sb, KERN_ERR, "unable to read boot sector");
> +		ret = -EIO;
> +		goto out;
…

Would you like to simplify this place?

+		return -EIO;


…
> +		exfat_msg(sb, KERN_ERR, "failed to load upcase table");
> +		goto out;

Would you like to omit this label?

+		return ret;


> +static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
> +{
…
> +		exfat_msg(sb, KERN_ERR, "failed to recognize exfat type");
> +		goto failed_mount;

The local variable “root_inode” contains still a null pointer at this place.

* Thus I would find a jump target like “reset_s_root” more appropriate.

* Can the corresponding pointer initialisation be omitted then?


…
> +failed_mount:
> +	if (root_inode)
> +		iput(root_inode);
…

I am informed in the way that this function tolerates the passing
of null pointers.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/inode.c?id=1d4c79ed324ad780cfc3ad38364ba1fd585dd2a8#n1567
https://elixir.bootlin.com/linux/v5.4-rc7/source/fs/inode.c#L1567

Thus I suggest to omit the extra pointer check also at this place.


> +static int __init init_exfat_fs(void)
> +{
…
+	err = exfat_cache_init();
+	if (err)
+		goto error;

Can it be nicer to return directly?


…
> +	if (!exfat_inode_cachep)
> +		goto error;

Can an other jump target like “shutdown_cache” be more appropriate?


> +	err = register_filesystem(&exfat_fs_type);
> +	if (err)
> +		goto error;
…

Can the label “destroy_cache” be more appropriate?


Regards,
Markus
