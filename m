From: James Bottomley <James.Bottomley@suse.de>
Date: Wed, 03 Mar 2010 07:20:31 +0000
Subject: Re: bug report: sd:  off by one in sd_read_block_limits()
Message-Id: <1267600111.4383.43.camel@mulgrave.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100302082135.GA6218@bicker>
	 <yq1tysy27ft.fsf@sermon.lab.mkp.net> <yq1k4tu2716.fsf@sermon.lab.mkp.net>
	 <yq1fx4i26cc.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1fx4i26cc.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Matthew Wilcox <matthew@wil.cx>, Dan Carpenter <error27@gmail.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2010-03-02 at 08:36 -0500, Martin K. Petersen wrote:
> James,
> 
> While I agree the original VPD code's double kmalloc() was a bit of a
> wart at least it did the right thing because it allocated a suitably
> sized buffer for page 0.
> 
> My concern with the interface you introduced in e3deec09 is that for
> devices that support a large number of VPD pages we won't be able to fit
> the page list in the allocated buffer.  And callers are likely to pick a
> buffer size that makes sense for the VPD page they are interested in.
> It's not a big deal in the block limits/block device characteristics
> case because they are big enough.

Actually, I don't really think that's a problem.  The design is to weed
out USB devices that have silly returns, either by not returning a
correct page zero, or by only accepting VPDs to the few pages and
crashing on ones they don't support.  If we run off the end of the
buffer because there are 32 or more pages, then it's reasonably safe to
assume the device will respond correctly to a VPD inquiry.

> But at the very minimum that interface should come with a big fat
> warning in the comment section that describes that the page list must
> also be able to fit.

But it doesn't have to ... if we correctly return more pages than will
fit in the buffer, it will proceed to do the requested page VPD inquiry.

James


