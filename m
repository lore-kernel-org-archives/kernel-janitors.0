From: David Vrabel <david.vrabel@citrix.com>
Date: Mon, 30 Nov 2015 14:13:39 +0000
Subject: Re: [Xen-devel] [PATCH 1/3] xen/gntdev: constify mmu_notifier_ops structures
Message-Id: <565C5993.2060301@citrix.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448834571-2988-1-git-send-email-Julia.Lawall@lip6.fr>
 <1448834571-2988-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448834571-2988-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-janitors@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, linux-kernel@vger.kernel.org

On 29/11/15 22:02, Julia Lawall wrote:
> This mmu_notifier_ops structure is never modified, so declare it as
> const, like the other mmu_notifier_ops structures.
> 
> Done with the help of Coccinelle.

Applied to for-linus-4.5, thanks.

David
