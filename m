From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 May 2015 08:14:16 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150502081416.GG16501@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <20150501200221.GF14154@mwanda>
 <9f81478864bc422c9a59cddbaa723052@EXCHCS32.ornl.gov>
 <20150501204930.GB2265@kroah.com>
 <CA8D4D3B-39CB-4DE4-835D-047692A7E5DE@intel.com>
 <20150501205835.GA2692@kroah.com>
 <C4CA2C71-C25D-42EB-AC52-963405EFE353@intel.com>
In-Reply-To: <C4CA2C71-C25D-42EB-AC52-963405EFE353@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>, "Simmons, James A." <simmonsja@ornl.gov>

On Fri, May 01, 2015 at 09:13:11PM +0000, Drokin, Oleg wrote:
> >> The patch was submitted.
> >> But it depends on a symbol that's not exported.
> >> I was not able to change that.
> >> http://www.spinics.net/lists/linux-mm/msg83997.html
> > 
> > But you were given a hint on how to change that :)
> 
> Well, the hint amounted to "don't do vmalloc if you cannot live with the
> GFP_KERNEL" allocations.
> 

Which email is that?

I only see where David says to implement vmalloc_node_gfp() and the talk
was about if that makes sense from a style perspective and then dies.

Anyway, this only seems to affect ptlrpc_alloc_rqbd() since  I think
that's the only place which calls OBD_CPT_ALLOC_PTR().  The rest can use
__vmalloc().

regards,
dan carpenter

