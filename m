From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 17 May 2010 19:06:00 +0000
Subject: Re: [patch v2] bio-integrity: use hardware sectors instead of block layer sectors
Message-Id: <yq1ljbi8i1z.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100507082928.GT27064@bicker> <20100507095414.GH27064@bicker>
In-Reply-To: <20100507095414.GH27064@bicker> (Dan Carpenter's message of "Fri,
	7 May 2010 11:54:14 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <jens.axboe@oracle.com>, Chuck Ebbert <cebbert@redhat.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <error27@gmail.com> writes:

Dan,

This one bitrotted in my mailbox for a while because it conflicted with
something else I was working on and then it slipped through the cracks.
Sorry about that.


Dan> The difference between "sectors" and "nr_sectors" is that "sectors"
Dan> is in terms of 512 byte sectors and "nr_sectors" is in terms of
Dan> hardware sectors.  They are only different for 4k sector devices.

Dan> Also I changed the name because as Jamie Lokier points out, "that
Dan> code is so asking for the variable to be called 'hw_sectors'."

The change is obviously functionally correct.  But I object to the
notion of hw_sectors.  The 1:1 mapping of DIF tuples and logical blocks
is even going away in SBC3.  So let's not perpetuate that.

I have a patch in my queue that gets rid of all the hw_sector references
in the integrity code.  I'll make sure to include your fix.

So thanks for spotting this.  I obviously haven't tested PI drives with
a 4KB logical block size in combination with device mapper...

-- 
Martin K. Petersen	Oracle Linux Engineering
