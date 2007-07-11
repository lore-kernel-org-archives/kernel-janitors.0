From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 11 Jul 2007 00:16:14 +0000
Subject: Re: [PATCH] Remove BKL from PCI syscalls
Message-Id: <20070711001614.GT9704@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070710165532.GP9704@parisc-linux.org>
In-Reply-To: <20070710165532.GP9704@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 10, 2007 at 04:49:36PM -0700, Greg KH wrote:
> On Tue, Jul 10, 2007 at 05:42:18PM -0600, Matthew Wilcox wrote:
> > I believe my patch to be a superset of this one, and recommend just
> > dropping Alan's patch.
> 
> How about just doing your patch on top of Alan's instead?

Seems like a lot more work; wasn't the point of keeping patches in a git
tree like this to make it easy to drop old patches?  I'd understand if
it meant pulling apart and rebasing a git tree.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
