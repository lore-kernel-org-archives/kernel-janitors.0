From: Greg KH <greg@kroah.com>
Date: Wed, 11 Jul 2007 00:30:01 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070711003001.GA30585@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 06:16:14PM -0600, Matthew Wilcox wrote:
> On Tue, Jul 10, 2007 at 04:49:36PM -0700, Greg KH wrote:
> > On Tue, Jul 10, 2007 at 05:42:18PM -0600, Matthew Wilcox wrote:
> > > I believe my patch to be a superset of this one, and recommend just
> > > dropping Alan's patch.
> > 
> > How about just doing your patch on top of Alan's instead?
> 
> Seems like a lot more work; wasn't the point of keeping patches in a git
> tree like this to make it easy to drop old patches?  I'd understand if
> it meant pulling apart and rebasing a git tree.

Well, it depends.  Alan's patch fixes up the api to do the proper thing
now, and your patch builds on that showing that we can now just drop the
BKL safely.  They are two different things in a way as is shown by the
fact that two different people approached this differently :)

Also, Alan's patch has already gotten a lot of testing in -mm for a
while and is about to be sent to Linus, while your's would be a bit
further back in the queue.

thanks,

greg k-h
