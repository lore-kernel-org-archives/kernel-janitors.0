From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 01 May 2015 18:05:30 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150501180530.GA26281@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Simmons, James A." <simmonsja@ornl.gov>
Cc: 'Julia Lawall' <Julia.Lawall@lip6.fr>, Oleg Drokin <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

On Fri, May 01, 2015 at 05:38:49PM +0000, Simmons, James A. wrote:
> >From: Julia Lawall <Julia.Lawall@lip6.fr>
> >
> >Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
> >kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.
> 
> Nak: James Simmons <jsimmons@infradead.org>
> 
> A simple replace will not work. The OBD_ALLOC and OBD_FREE functions allocate memory
> anywhere from one page to 4MB in size.

OBD_FREE() just calls kfree(), it does not allocate any memory, so that
replacement is always ok.

thanks,

greg k-h
