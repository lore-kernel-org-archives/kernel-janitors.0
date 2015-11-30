From: David Vrabel <dvrabel@cantab.net>
Date: Mon, 30 Nov 2015 14:13:15 +0000
Subject: Re: [Xen-devel] [PATCH] xen/grant-table: constify gnttab_ops structure
Message-Id: <565C597B.2030500@cantab.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1448720920-10606-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1448720920-10606-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, kernel-janitors@vger.kernel.org, David Vrabel <david.vrabel@citrix.com>, linux-kernel@vger.kernel.org

On 28/11/15 14:28, Julia Lawall wrote:
> The gnttab_ops structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.

Applied to for-linus-4.5, thanks.

David
