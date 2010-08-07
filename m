From: Dan Carpenter <error27@gmail.com>
Date: Sat, 07 Aug 2010 19:08:14 +0000
Subject: Re: [PATCH 01/18] char: moxa: call disable_pci_device() if
Message-Id: <20100807190814.GZ9031@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281124152-12630-1-git-send-email-segooon@gmail.com> <20100807072205.GW9031@bicker> <20100807085512.GA5783@albatros> <20100807095852.GX9031@bicker> <20100807180251.GA2686@albatros>
In-Reply-To: <20100807180251.GA2686@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Alan Cox <alan@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Rakib Mullick <rakib.mullick@gmail.com>, Ben Hutchings <ben@decadent.org.uk>, linux-kernel@vger.kernel.org

On Sat, Aug 07, 2010 at 10:02:52PM +0400, Vasiliy Kulikov wrote:
> 
> The thing is not in that pci_enable_device() is nestable, but in that
> some buggy non-mainline drivers may not use PCI api, but use
> request_*(). In this case PCI bus doesn't see this driver and tries to
> call mainline driver probe(). It sees that resources are already
> grabbed. The only reason can be another driver that rules this device
> (or our kernel is crazy). As we are robust driver we don't want to break
> this buggy third party driver :-)
> 

What Jeff Garzik was saying in those days if two people called
pci_enable_device() it wasn't a problem, but if one person then called
pci_disable_device() the other person who still wanted it enabled was
screwed.  That model was "*first* person out of the building lock the
door."

That was half a decade ago though.  The fix that Jeff proposed wasn't
really a good one because there is no way people would get that right.
None of that applies any more.  These days we just call enable when we 
want it enabled and disable when we are done.  All the dependencies are
handled for us.

In fact, if we try to use the old hacks and work arounds, that will cause
bugs in the new code...

regards,
dan carpenter

