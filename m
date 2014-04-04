From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Apr 2014 13:26:51 +0000
Subject: Re: [PATCH] staging: comedi: drivers: pcl812.c: fixed a coding style issue
Message-Id: <20140404132651.GV6991@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1396605929-10514-1-git-send-email-gmate.amit@gmail.com>
 <20140404110707.GT6991@mwanda>
 <20140404114852.GA12452@gmail.com>
In-Reply-To: <20140404114852.GA12452@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, abbotti@mev.co.uk, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Apr 04, 2014 at 02:48:52PM +0300, Kumar Amit Mehta wrote:
> On Fri, Apr 04, 2014 at 02:07:07PM +0300, Dan Carpenter wrote:
> > On Fri, Apr 04, 2014 at 01:05:29PM +0300, Kumar Amit Mehta wrote:
> > > Fixed a coding style issue. Reported by checkpatch.pl
> > > 
> > 
> > It's better if the commit messages are more specific than this.
> 
> So, should I resend the patch with a more appropriate commit message ?

[PATCH] staging: comedi: drivers: pcl812.c: add curly braces for checkpatch

Kernel style is that if one side of the if else statement gets has curly
braces then both side should have them.

regards,
dan carpenter

