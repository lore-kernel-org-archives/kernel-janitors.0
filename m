From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 03 May 2015 05:53:04 +0000
Subject: Re: [PATCH] staging: lustre: obd_support: Add obd_cpt_alloc function
Message-Id: <alpine.DEB.2.02.1505030751020.2068@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430601408-12847-1-git-send-email-Julia.Lawall@lip6.fr> <D7D0EE01-6BD2-498F-88D5-CC3829A39561@intel.com>
In-Reply-To: <D7D0EE01-6BD2-498F-88D5-CC3829A39561@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "<HPDD-discuss@lists.01.org>" <HPDD-discuss@ml01.01.org>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>

On Sat, 2 May 2015, Drokin, Oleg wrote:

> 
> On May 2, 2015, at 5:16 PM, Julia Lawall wrote:
> 
> > Summarize OBD_CPT_ALLOC_GFP, OBD_CPT_ALLOC, and OBD_CPT_ALLOC_PTR as a
> > function, obd_cpt_alloc.
> > 
> > Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> > 
> > ---
> > 
> > Some questions: Is the name OK?  Is the NULL test needed?  If not, should
> > the call to kzalloc_node with the call to cfs_cpt_spread_node just be
> > inlined into the call sites?
> 
> I think we don't need this function at all, we can use kzalloc/kzalloc_node directly with cfs_cpt_spread_node call in.

So everywhere the CPT macro is called, it is known that the value is not 
NULL?  I looked at some call sites, but it's not obvious to determine 
that.

> What we do need is obd_cpt_alloc_large similar to how we need 
> obd_alloc_large (I know I still owe you a proper patch with that). The 
> only differences between the two would then be passing down of the cpt 
> (and it's use) or not.

I saw that patch.  Thanks.

julia
