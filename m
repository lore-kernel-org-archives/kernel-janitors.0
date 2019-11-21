From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Thu, 21 Nov 2019 08:19:30 +0000
Subject: RE: [PATCH v4 10/13] exfat: add nls operations
Message-Id: <000f01d5a044$65ff7b40$31fe71c0$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
        <CGME20191121052920epcas1p3e5b6c0251e869e265d19798dbeebab4e@epcas1p3.samsung.com>
        <20191121052618.31117-11-namjae.jeon@samsung.com>
        <df089831-038c-3b39-6ec7-684d1f698756@web.de>
In-Reply-To: <df089831-038c-3b39-6ec7-684d1f698756@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Daniel Wagner' <dwagner@suse.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Nikolay Borisov' <nborisov@suse.com>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> > +	exfat_msg(sb, KERN_ERR,
> > +			"failed to load upcase table (idx : 0x%08x, chksum :
> 0x%08x, utbl_chksum : 0x%08x)\n",
> > +			index, checksum, utbl_checksum);
> > +
> > +	ret = -EINVAL;
> 
> Can a blank line be omitted between the message and the error code?
Okay.
> 
> 
> > +release_bh:
> > +	brelse(bh);
> > +	exfat_free_upcase_table(sb);
> > +	return ret;
> > +}
> 
> I got the impression that the resource management is still questionable
> for this function implementation.
> 
> 1. Now I suggest to move the call of the function “brelse” to the end
>    of the while loop. The label “release_bh” would be renamed to “free_table”
> then.
Okay.
> 
> 2. Can a variable initialisation be converted to the assignment “ret = -EIO;”
>    in an if branch?
Okay, Will fix it on v5.

Thanks for your review!
> 
> Regards,
> Markus
