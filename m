From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Mon, 18 Nov 2019 05:04:13 +0000
Subject: RE: [PATCH 03/13] exfat: add inode operations
Message-Id: <00bc01d59dcd$9ecbf1c0$dc63d540$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191113081800.7672-4-namjae.jeon@samsung.com>
        <CGME20191117141554epcas1p16bea365f1667a39e1d28a1f799396567@epcas1p1.samsung.com>
        <82520012-9940-7f2b-3bac-bea5c2396ccd@web.de>
In-Reply-To: <82520012-9940-7f2b-3bac-bea5c2396ccd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> …
> > +++ b/fs/exfat/inode.c
> …
> > +static int exfat_create(struct inode *dir, struct dentry *dentry, umode_t
> mode,
> > +		bool excl)
> > +{
> …
> +out:
> +	mutex_unlock(&EXFAT_SB(sb)->s_lock);
> 
> Can the label “unlock” be more appropriate?
Yep, Will change it.
> 
> 
> > +static struct dentry *exfat_lookup(struct inode *dir, struct dentry
> *dentry,
> > +		unsigned int flags)
> > +{
> …
> > +error:
> > +	mutex_unlock(&EXFAT_SB(sb)->s_lock);
> 
> Would you like to use the label “unlock” also at this place (and similar
> ones)?
Yep, Will change all ones.

> 
> 
> > +static int exfat_search_empty_slot(struct super_block *sb,
> > +		struct exfat_hint_femp *hint_femp, struct exfat_chain *p_dir,
> > +		int num_entries)
> > +{
> …
> > +out:
> > +	kfree(clu);
> 
> How do you think about to rename the label to “free_clu”?
Yep, Will change it on V2.

Thanks for your review!
> 
> Regards,
> Markus
