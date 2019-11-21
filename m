From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 21 Nov 2019 13:07:15 +0000
Subject: Re: [PATCH v4 04/13] exfat: add directory operations
Message-Id: <498a958f-9066-09c6-7240-114234965c1a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052917epcas1p259b8cb61ab86975cabc0cf4815a8dc38@epcas1p2.samsung.com>
 <20191121052618.31117-5-namjae.jeon@samsung.com>
In-Reply-To: <20191121052618.31117-5-namjae.jeon@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

…
> +++ b/fs/exfat/dir.c
…
> +static int exfat_readdir(struct inode *inode, struct exfat_dir_entry *dir_entry)
> +{
…
> +			if (!ep) {
> +				ret = -EIO;
> +				goto free_clu;
> +			}

How do you think about to move a bit of common exception handling code
(at similar places)?

+			if (!ep)
+				goto e_io;


…
> +free_clu:
> +	kfree(clu);
> +	return ret;

+
+e_io:
+	ret = -EIO;
+	goto free_clu;

> +}
…
> +static void exfat_set_entry_type(struct exfat_dentry *ep, unsigned int type)
> +{
> +	if (type == TYPE_UNUSED) {
> +		ep->type = EXFAT_UNUSED;
> +	} else if (type == TYPE_DELETED) {
> +		ep->type &= EXFAT_DELETE;

The other assignments are working without the ampersand.
Thus I would find its usage suspicious at this place.


…
> +int update_dir_chksum(struct inode *inode, struct exfat_chain *p_dir,
> +		int entry)
> +{
…
> +out_unlock:
> +	brelse(fbh);

Can the label “release_fbh” be more helpful?


…
> +struct exfat_entry_set_cache *exfat_get_dentry_set(struct super_block *sb,
> +		struct exfat_chain *p_dir, int entry, unsigned int type,
> +		struct exfat_dentry **file_ep)
> +{
…
> +	/* FIXME : is available in error case? */
> +	if (p_dir->dir == DIR_DELETED) {
> +		exfat_msg(sb, KERN_ERR, "access to deleted dentry\n");
> +		return NULL;
> +	}

Will this place need any further improvements?


…
> +	bh = sb_bread(sb, sec);
> +	if (!bh)
> +		goto err_out;

Can it be nicer to return directly?


…
> +	ep = (struct exfat_dentry *)(bh->b_data + off);
> +	entry_type = exfat_get_entry_type(ep);
> +
> +	if (entry_type != TYPE_FILE && entry_type != TYPE_DIR)
> +		goto err_out;

+		goto release_bh;

…
> +		if (!exfat_validate_entry(exfat_get_entry_type(ep), &mode))
> +			goto err_out;


…
> +	brelse(bh);
> +
> +	return es;
> +err_out:
> +	kfree(es);
> +	brelse(bh);

I suggest to improve the exception handling also for this function implementation.

+	brelse(bh);
+	return es;
+
+free_es:
+	kfree(es);
+release_bh:
+	brelse(bh);


* Would you like to adjust any more jump targets at similar places?

* Can another initialisation be omitted then for a pointer variable?

Regards,
Markus
