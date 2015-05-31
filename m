From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 31 May 2015 02:24:56 +0000
Subject: Re: [PATCH v4 00/13] staging: lustre: lnet: code cleanups
Message-Id: <20150531022456.GA30873@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
 <20150522092142.GJ4150@mwanda>
 <CABqvwjsJXJYciMDHqy9vEdL6dGLhx3+Pi0_ro6192Z5SGR9Q_w@mail.gmail.com>
 <20150523101428.GX22558@mwanda>
 <CABqvwjvKg1yK2b=2+ASGvJ4xT3Sq4XMhY70makjwccj+duvAEQ@mail.gmail.com>
 <20150523123904.GA12407@sudip-PC>
 <CABqvwjtPdX4yfEob+LwurrT=ACdhNkwS8u9Zh9-gjBH6oo56Nw@mail.gmail.com>
In-Reply-To: <CABqvwjtPdX4yfEob+LwurrT=ACdhNkwS8u9Zh9-gjBH6oo56Nw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Shuey <shuey@purdue.edu>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Drokin, Oleg" <oleg.drokin@intel.com>, HPDD-discuss@ml01.01.org, Dan Carpenter <dan.carpenter@oracle.com>, lustre-devel@lists.lustre.org

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Sat, May 23, 2015 at 10:05:27AM -0400, Michael Shuey wrote:
> Ah - that explains it.  I added additional files to the series, but
> simply re-applied the original round of patches.  They would've not
> been tagged as v4, while the patches pertaining to the newly-modified
> files had v4 in the subject.

The way you sent these is a mess, I can't sort by subject and apply them
properly.

Either put the v4 at the front, for all patches, like this:
	[PATCH v4 01/13]
or at the end of the number:
	[PATCH 01/13 v4]
so I can sort them.

Please fix up and resend this series, I've dropped it from my queue.

thanks,

greg k-h
