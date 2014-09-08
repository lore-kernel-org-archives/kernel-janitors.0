From: David Vrabel <david.vrabel@citrix.com>
Date: Mon, 08 Sep 2014 17:34:39 +0000
Subject: Re: [Xen-devel] [patch] xen-scsifront: use GFP_ATOMIC under spin_lock
Message-Id: <540DE8AF.60906@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140908111542.GA6947@mwanda>
In-Reply-To: <20140908111542.GA6947@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, David Vrabel <david.vrabel@citrix.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>

On 08/09/14 12:15, Dan Carpenter wrote:
> This function is only called with a spin_lock held and IRQs disabled.
> The allocation is not allowed to sleep and NOIO is not sufficient, it
> has to be ATOMIC.

Applied this and the scsiback one to devel/for-linus-3.18.

Thanks.

David
