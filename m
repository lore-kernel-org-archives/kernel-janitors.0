From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Mon, 21 May 2012 14:40:53 +0000
Subject: Re: [patch] hvc_xen: NULL dereference on allocation failure
Message-Id: <20120521144053.GA24239@phenom.dumpdata.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120515084746.GC30265@elgon.mountain>
 <alpine.DEB.2.00.1205151119260.26786@kaball-desktop>
In-Reply-To: <alpine.DEB.2.00.1205151119260.26786@kaball-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Dan Carpenter <dan.carpenter@oracle.com>, Alan Cox <alan@linux.intel.com>

On Tue, May 15, 2012 at 11:20:23AM +0100, Stefano Stabellini wrote:
> On Tue, 15 May 2012, Dan Carpenter wrote:
> > If kzalloc() returns a NULL here, we pass a NULL to
> > xencons_disconnect_backend() which will cause an Oops.
> > 
> > Also I removed the __GFP_ZERO while I was at it since kzalloc() implies
> > __GFP_ZERO.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>

applied.
>  
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
