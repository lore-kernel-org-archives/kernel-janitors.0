From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Fri, 22 Nov 2019 03:00:16 +0000
Subject: RE: [PATCH v4 04/13] exfat: add directory operations
Message-Id: <004901d5a0e0$f7bf1030$e73d3090$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
        <CGME20191121052917epcas1p259b8cb61ab86975cabc0cf4815a8dc38@epcas1p2.samsung.com>
        <20191121052618.31117-5-namjae.jeon@samsung.com>
        <498a958f-9066-09c6-7240-114234965c1a@web.de>
In-Reply-To: <498a958f-9066-09c6-7240-114234965c1a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Daniel Wagner' <dwagner@suse.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Nikolay Borisov' <nborisov@suse.com>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> 
> …
> > +++ b/fs/exfat/dir.c
> …
> > +static int exfat_readdir(struct inode *inode, struct exfat_dir_entry
> *dir_entry)
> > +{
> …
> > +			if (!ep) {
> > +				ret = -EIO;
> > +				goto free_clu;
> > +			}
> 
> How do you think about to move a bit of common exception handling code
> (at similar places)?
Not sure it is good. Other review comments are okay. Will fix them on v5.
> 
> +			if (!ep)
> +				goto e_io;
> 
> 
> …
> > +free_clu:
> > +	kfree(clu);
> > +	return ret;
> 
> +
> +e_io:
> +	ret = -EIO;
> +	goto free_clu;
> 
> > +}
