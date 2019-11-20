From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 20 Nov 2019 20:31:00 +0000
Subject: Re: [PATCH v3 01/13] exfat: add in-memory and on-disk structures and headers
Message-Id: <20191120203100.GA3109949@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094020epcas1p26de9d7e4e2ab8ad5d6ecaf23e2dfdca8@epcas1p2.samsung.com>
 <20191119093718.3501-2-namjae.jeon@samsung.com>
 <30222888-e62e-494e-269e-cb1a0746a01f@web.de>
In-Reply-To: <30222888-e62e-494e-269e-cb1a0746a01f@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Nikolay Borisov <nborisov@suse.com>, Sungjong Seo <sj1557.seo@samsung.com>, Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

On Wed, Nov 20, 2019 at 09:21:13PM +0100, Markus Elfring wrote:
> …
> > +++ b/fs/exfat/exfat_fs.h
> …
> > +/* balloc.c */
> > +int exfat_load_bitmap(struct super_block *sb);
> …
> 
> Such function declarations were grouped according to the mentioned
> source file.
> How do you think about to include them from separate header files
> for the desired programming interface?

No.
