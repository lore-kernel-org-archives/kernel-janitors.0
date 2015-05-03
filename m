From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 03 May 2015 14:07:16 +0000
Subject: [PATCH 0/3 v2] Replace OBD_CPT_ALLOC etc by kzalloc_node
Message-Id: <1430662039-26557-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

The complete semantic patch used to make this transformation is as follows:
(http://coccinelle.lip6.fr/).

// <smpl>
@@
expression ptr,cptab,cpt,size,gfp;
@@

- OBD_CPT_ALLOC_GFP(ptr, cptab, cpt, size, gfp)
+ ptr = kzalloc_node(size, gfp, cfs_cpt_spread_node(cptab, cpt))

@@
expression ptr,cptab,cpt,size;
@@

- OBD_CPT_ALLOC(ptr, cptab, cpt, size)
+ ptr = kzalloc_node(size, GFP_NOFS, cfs_cpt_spread_node(cptab, cpt))

@@
expression ptr,cptab,cpt;
@@

- OBD_CPT_ALLOC_PTR(ptr, cptab, cpt)
+ ptr = kzalloc_node(sizeof(*ptr), GFP_NOFS, cfs_cpt_spread_node(cptab,cpt))
// </smpl>

Note that the previously proposed patch "Add obd_cpt_alloc function" is not
needed, as the transformation is done without adding a new function.

These patches should be applied after the patches with subjects "Use
kzalloc and kfree" and "remove unneeded null test before free".

v2 makes the subject lines more uniform.
