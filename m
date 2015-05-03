From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 03 May 2015 18:17:10 +0000
Subject: Re: [PATCH 0/11] Use kzalloc and kfree
Message-Id: <20150503181710.GA24621@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org, Oleg Drokin <oleg.drokin@intel.com>, Andreas Dilger <andreas.dilger@intel.com>, kernel-janitors@vger.kernel.org, HPDD-discuss@ml01.01.org

On Fri, May 01, 2015 at 05:51:11PM +0200, Julia Lawall wrote:
> Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
> kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.  The complete
> semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)

<snip>

You lost the leading '0' on the early patches here, did you use git
send-email for these?  I'll just sort them by hand, but in the future,
please fix it up to make it easier to apply things.

thanks,

greg k-h
