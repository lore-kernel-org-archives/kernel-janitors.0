From: Greg KH <greg@kroah.com>
Date: Tue, 20 Nov 2007 06:36:49 +0000
Subject: Re: 2.6.23.1->2.6.23.8 breaks root Makefile
Message-Id: <20071120063649.GA4846@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1195489140.21337.10.camel@ronispc.chem.mcgill.ca>
In-Reply-To: <1195489140.21337.10.camel@ronispc.chem.mcgill.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Nov 19, 2007 at 11:19:00AM -0500, David Ronis wrote:
> Hi
> 
> The current main Makefile incorrectly identified my ld as one that
> supports --build-id (it didn't).  The problem is fixed by upgrading to
> the latest binutils, version 2.18, which does, but somehow  I suspect
> that this wasn't what was intended.  For what it's worth, I was running
> with slackware's binutils-2.17.50.0.17.

Can you narrow it down to the patch that caused this problem?

thanks,

greg k-h
