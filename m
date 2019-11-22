From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Nov 2019 08:34:47 +0000
Subject: Re: [PATCH v4 04/13] exfat: add directory operations
Message-Id: <20191122083446.GG5604@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121052618.31117-1-namjae.jeon@samsung.com>
 <CGME20191121052917epcas1p259b8cb61ab86975cabc0cf4815a8dc38@epcas1p2.samsung.com>
 <20191121052618.31117-5-namjae.jeon@samsung.com>
 <498a958f-9066-09c6-7240-114234965c1a@web.de>
 <004901d5a0e0$f7bf1030$e73d3090$@samsung.com>
 <0e17c0a7-9b40-12a4-3f3f-500b9abb66de@web.de>
 <00a001d5a10d$da529670$8ef7c350$@samsung.com>
In-Reply-To: <00a001d5a10d$da529670$8ef7c350$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: 'Markus Elfring' <Markus.Elfring@web.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Daniel Wagner' <dwagner@suse.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Nikolay Borisov' <nborisov@suse.com>, 'Sungjong Seo' <sj1557.seo@samsung.com>, 'Valdis =?utf-8?Q?Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

On Fri, Nov 22, 2019 at 05:21:34PM +0900, Namjae Jeon wrote:
> > The software development opinions can vary also for this change pattern
> > according to different design goals.
> > Is such a transformation just another possibility to reduce duplicate
> > source code a bit?
> I changed it without unnecessary goto abuse. Look at the next version later.
> Thanks!

Markus, could you stop adding kernel-janitors to the CC list?  None of
this is at all related to kernel-janitors.  We can't see the context and
we will never see the "next version" mentioned here.

:P

regards,
dan carpenter
