From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Fri, 22 Nov 2019 08:21:34 +0000
Subject: RE: [PATCH v4 04/13] exfat: add directory operations
Message-Id: <00a001d5a10d$da529670$8ef7c350$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
        <CGME20191121052917epcas1p259b8cb61ab86975cabc0cf4815a8dc38@epcas1p2.samsung.com>
        <20191121052618.31117-5-namjae.jeon@samsung.com>
        <498a958f-9066-09c6-7240-114234965c1a@web.de>
        <004901d5a0e0$f7bf1030$e73d3090$@samsung.com>
        <0e17c0a7-9b40-12a4-3f3f-500b9abb66de@web.de>
In-Reply-To: <0e17c0a7-9b40-12a4-3f3f-500b9abb66de@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Daniel Wagner' <dwagner@suse.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Nikolay Borisov' <nborisov@suse.com>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org


> >> …
> >>> +++ b/fs/exfat/dir.c
> >> …
> >>> +static int exfat_readdir(struct inode *inode, struct exfat_dir_entry
> >> *dir_entry)
> >>> +{
> >> …
> >>> +			if (!ep) {
> >>> +				ret = -EIO;
> >>> +				goto free_clu;
> >>> +			}
> >>
> >> How do you think about to move a bit of common exception handling code
> >> (at similar places)?
> > Not sure it is good.
> 
> The software development opinions can vary also for this change pattern
> according to different design goals.
> Is such a transformation just another possibility to reduce duplicate
> source code a bit?
I changed it without unnecessary goto abuse. Look at the next version later.
Thanks!
> 
> Regards,
> Markus
