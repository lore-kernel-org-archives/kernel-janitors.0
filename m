From: Matthew Wilcox <matthew@wil.cx>
Date: Tue, 02 Mar 2010 13:31:24 +0000
Subject: Re: bug report: sd:  off by one in sd_read_block_limits()
Message-Id: <20100302133124.GF6567@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100302082135.GA6218@bicker> <yq1tysy27ft.fsf@sermon.lab.mkp.net> <yq1k4tu2716.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1k4tu2716.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Dan Carpenter <error27@gmail.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 02, 2010 at 08:21:41AM -0500, Martin K. Petersen wrote:
> >>>>> "Martin" = Martin K Petersen <martin.petersen@oracle.com> writes:
> 
> Actually, looking closer at the VPD mechanism in e3deec09 we need to fit
> the page header as well...

These aren't the only two bugs introduced either.  If a device has more VPD
pages than the length of the buffer that the caller has allocated, we will
now incorrectly report that the device doesn't support that page.

James, was any problem actually observed that led to e3deec09?  I really
think you should revert it.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
