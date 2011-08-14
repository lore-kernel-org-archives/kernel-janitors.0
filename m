From: Dan Carpenter <error27@gmail.com>
Date: Sun, 14 Aug 2011 19:10:20 +0000
Subject: Re: [patch] target: use after free in error handling
Message-Id: <20110814191020.GB10560@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110809123006.GJ7659@shale.localdomain>
 <1313300165.16439.45.camel@haakon2.linux-iscsi.org>
In-Reply-To: <1313300165.16439.45.camel@haakon2.linux-iscsi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: Andy Grover <agrover@redhat.com>, Roland Dreier <roland@kernel.org>, Christoph Hellwig <hch@lst.de>, "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>, "open list:TARGET SUBSYSTEM" <target-devel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Ah yes...  I should have caught the missing goto out.  I hardly feel
like I deserve the Author tag for this one but I'm always happy to
take credit for other people's hard work.  Moving up the corporate
ladder and all that.

regards,
dan carpenter
