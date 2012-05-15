From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Date: Tue, 15 May 2012 10:20:23 +0000
Subject: Re: [patch] hvc_xen: NULL dereference on allocation failure
Message-Id: <alpine.DEB.2.00.1205151119260.26786@kaball-desktop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515084746.GC30265@elgon.mountain>
In-Reply-To: <20120515084746.GC30265@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefano Stabellini <Stefano.Stabellini@eu.citrix.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Alan Cox <alan@linux.intel.com>

On Tue, 15 May 2012, Dan Carpenter wrote:
> If kzalloc() returns a NULL here, we pass a NULL to
> xencons_disconnect_backend() which will cause an Oops.
> 
> Also I removed the __GFP_ZERO while I was at it since kzalloc() implies
> __GFP_ZERO.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
 
