From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Sun, 03 May 2015 16:15:23 +0000
Subject: Re: [PATCH 0/3 v2] Replace OBD_CPT_ALLOC etc by kzalloc_node
Message-Id: <6D85B40F-811A-4226-BD79-C76C2BC31EA9@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430662039-26557-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1430662039-26557-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "<linux-kernel@vger.kernel.org>" <linux-kernel@vger.kernel.org>, "<kernel-janitors@vger.kernel.org>" <kernel-janitors@vger.kernel.org>, "<devel@driverdev.osuosl.org>" <devel@driverdev.osuosl.org>, "<HPDD-discuss@lists.01.org>" <HPDD-discuss@ml01.01.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Dilger, Andreas" <andreas.dilger@intel.com>

All three are good from my perspective.
Thanks!

On May 3, 2015, at 10:07 AM, Julia Lawall wrote:

> The complete semantic patch used to make this transformation is as follows:
> (http://coccinelle.lip6.fr/).
> 
> // <smpl>
> @@
> expression ptr,cptab,cpt,size,gfp;
> @@
> 
> - OBD_CPT_ALLOC_GFP(ptr, cptab, cpt, size, gfp)
> + ptr = kzalloc_node(size, gfp, cfs_cpt_spread_node(cptab, cpt))
> 
> @@
> expression ptr,cptab,cpt,size;
> @@
> 
> - OBD_CPT_ALLOC(ptr, cptab, cpt, size)
> + ptr = kzalloc_node(size, GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))
> 
> @@
> expression ptr,cptab,cpt;
> @@
> 
> - OBD_CPT_ALLOC_PTR(ptr, cptab, cpt)
> + ptr = kzalloc_node(sizeof(*ptr), GFP_NOFS, cfs_cpt_spread_node(cptab,cpt))
> // </smpl>
> 
> Note that the previously proposed patch "Add obd_cpt_alloc function" is not
> needed, as the transformation is done without adding a new function.
> 
> These patches should be applied after the patches with subjects "Use
> kzalloc and kfree" and "remove unneeded null test before free".
> 
> v2 makes the subject lines more uniform.

