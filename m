From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
Date: Mon, 26 Mar 2012 18:46:52 +0000
Subject: Re: [patch] xHCI: use gfp flags from caller instead of GFP_ATOMIC
Message-Id: <20120326184652.GA5453@xanatos>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120323120900.GA20936@elgon.mountain>
In-Reply-To: <20120323120900.GA20936@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Mar 23, 2012 at 08:04:51PM +0300, Dan Carpenter wrote:
> On Fri, Mar 23, 2012 at 09:29:57AM -0700, Sarah Sharp wrote:
> > On Fri, Mar 23, 2012 at 03:09:00PM +0300, Dan Carpenter wrote:
> > > We're not holding a lock here so we can use the gfp flags the caller
> > > specifies instead of GFP_ATOMIC.  The callers use GFP_ATOMIC so this
> > > change doesn't affect how the kernel runs, but it's a cleanup.
> > 
> > Nak.  We are holding a lock in all the xhci_queue* functions, so we
> > need GFP_ATOMIC.  It's locked in a parent function, xhci_urb_enqueue().
> > 
> 
> Sorry, bad changlog on my part.  I saw that it was locked in the
> parent, but I meant that it's not taking a lock here.  The parent
> specifies GFP_ATOMIC so the parent is fine.
> 
> I don't think we should bother passing the GFP flags if we don't use
> them.

Ok, now I understand, and I agree.  Please resend the patch with a
better change log and I'll apply it.

Sarah Sharp
