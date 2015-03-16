From: David Vrabel <david.vrabel@citrix.com>
Date: Mon, 16 Mar 2015 14:47:26 +0000
Subject: Re: [Xen-devel] [patch] xen/mce: fix up xen_late_init_mcelog() error handling
Message-Id: <5506ECFE.6020308@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/03/15 11:24, Dan Carpenter wrote:
> Static checkers complain about the missing call to misc_deregister() if
> bind_virq_for_mce() fails.
> 
> Also I reversed the tests so that we do error handling instead of
> success handling.  That way we just have a series of function calls
> instead of the more complicated nested if statements in the original
> code.  Let's preserve the error codes as well.

Applied to devel/for-linus-4.1, thanks.

David
