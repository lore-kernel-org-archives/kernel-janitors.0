From: Joe Perches <joe@perches.com>
Date: Thu, 06 Oct 2016 17:51:44 +0000
Subject: Re: [PATCH 37/54] md/raid5: Replace a seq_printf() call by seq_puts() in raid5_status()
Message-Id: <1475776304.1914.17.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <786843ef-4b6f-eb04-7326-2f6f5b408826@users.sourceforge.net>
         <92c52f1d-d151-cea6-e9ac-31378e6862d0@users.sourceforge.net>
         <1475771699.1914.10.camel@perches.com>
         <d896b697-6735-e50d-00b0-2b3d9f371c99@users.sourceforge.net>
         <1475775403.1914.13.camel@perches.com>
         <c158cfe0-d8d8-e433-0cea-2ef1fc51e48b@users.sourceforge.net>
In-Reply-To: <c158cfe0-d8d8-e433-0cea-2ef1fc51e48b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-raid@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Guoqing Jiang <gqjiang@suse.com>, Jens Axboe <axboe@fb.com>, Mike Christie <mchristi@redhat.com>, Neil Brown <neilb@suse.com>, Shaohua Li <shli@kernel.org>, Tomasz Majchrzak <tomasz.majchrzak@intel.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 2016-10-06 at 19:49 +0200, SF Markus Elfring wrote:
> > Why don't _you_ try to implement that in checkpatch instead?
> How are the chances that any other software developer would be quicker (than me) for such
> an addition because of more practical knowledge for the programming language "Perl"?

Extremely high.

What are the chances you can add useful attributes to your skilz?

