From: Jonathan Nieder <jrnieder@gmail.com>
Date: Tue, 05 Apr 2011 20:35:14 +0000
Subject: Re: [patch v2] bio-integrity: use hardware sectors instead of block
Message-Id: <20110405203435.GA13179@elie>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100507082928.GT27064@bicker>
 <20100507095414.GH27064@bicker>
 <yq1ljbi8i1z.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1ljbi8i1z.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Dan Carpenter <error27@gmail.com>, Jens Axboe <jens.axboe@oracle.com>, Chuck Ebbert <cebbert@redhat.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org

Hi,

On 2010-05-17, Martin K. Petersen wrote:

> The change is obviously functionally correct.  But I object to the
> notion of hw_sectors.  The 1:1 mapping of DIF tuples and logical blocks
> is even going away in SBC3.  So let's not perpetuate that.
>
> I have a patch in my queue that gets rid of all the hw_sector references
> in the integrity code.  I'll make sure to include your fix.
>
> So thanks for spotting this.  I obviously haven't tested PI drives with
> a 4KB logical block size in combination with device mapper...

I'm just curious: did anything come of this?  Nowadays gcc 4.6 warns
about the same unused nr_sector var smatch warned about, so new
readers are coming to the same question of why this function doesn't
use hardware sectors.
