From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 May 2017 12:38:33 +0000
Subject: Re: [PATCH 2/2] vhost/scsi: Delete error messages for failed memory allocations in five functions
Message-Id: <20170522123833.asx2biaw4xaz4qpv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bafa65e4-08fe-efdb-d836-7657e8a64749@users.sourceforge.net>
	<babc429d-6440-92aa-e1d0-eee2636a8d0f@users.sourceforge.net>
	<20170522094320.GE12205@stefanha-x1.localdomain>
	<557bdff4-6dc2-756d-0d59-9f688ef11f0a@users.sourceforge.net>
	<20170522112320.GA22806@stefanha-x1.localdomain>
In-Reply-To: <20170522112320.GA22806@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org, SF Markus Elfring <elfring@users.sourceforge.net>

On Mon, May 22, 2017 at 12:23:20PM +0100, Stefan Hajnoczi wrote:
> I'm not sure if kmalloc() and friends guarantee to show
> a message (not just the first time, but for every failed allocation)?
>

It prints multiple times, but it's ratelimited.  It can also be disabled
using a config option.

See slab_out_of_memory().

regards,
dan carpenter

