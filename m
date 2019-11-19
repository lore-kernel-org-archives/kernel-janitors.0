From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 19 Nov 2019 13:32:55 +0000
Subject: Re: [PATCH v3 02/13] exfat: add super block operations
Message-Id: <3bf9fea7-99d3-3a9b-6565-39d62f5ee473@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094021epcas1p1ef79711e2ea59c4e909a30a9ac2daa3d@epcas1p1.samsung.com>
 <20191119093718.3501-3-namjae.jeon@samsung.com>
In-Reply-To: <20191119093718.3501-3-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/super.c
…
> +static int __exfat_fill_super(struct super_block *sb)
> +{
…
> +free_upcase:
> +	exfat_free_upcase_table(sb);

Label alternatives?
* free_table
* free_upcase_table


…
> +static int exfat_fill_super(struct super_block *sb, struct fs_context *fc)
> +{
…
> +	if (EXFAT_SB(sb)->options.case_sensitive)
> +		sb->s_d_op = &exfat_dentry_ops;
> +	else
> +		sb->s_d_op = &exfat_ci_dentry_ops;

How do you think about the usage of conditional operators at similar places?

+	sb->s_d_op = EXFAT_SB(sb)->options.case_sensitive
+		     ? &exfat_dentry_ops;
+		     : &exfat_ci_dentry_ops;


…
> +failed_mount3:
> +	iput(root_inode);

I find the label “put_inode” more appropriate.


…
> +failed_mount2:
> +	exfat_free_upcase_table(sb);

I find the label “free_table” more helpful.


…
> +failed_mount:
> +	if (sbi->nls_io)
> +		unload_nls(sbi->nls_io);

Can the label “check_nls_io” be nicer?


…
> +static int __init init_exfat_fs(void)
> +{
…
> +shutdown_cache:
> +	exfat_cache_shutdown();
> +
> +	return err;

Would you like to omit blank lines at similar places?

Regards,
Markus
