From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 01 May 2015 15:51:11 +0000
Subject: [PATCH 0/11] Use kzalloc and kfree
Message-Id: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, HPDD-discuss@ml01.01.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andreas Dilger <andreas.dilger@intel.com>, Oleg Drokin <oleg.drokin@intel.com>

Replace OBD_ALLOC, OBD_ALLOC_WAIT, OBD_ALLOC_PTR, and OBD_ALLOC_PTR_WAIT by
kalloc/kcalloc, and OBD_FREE and OBD_FREE_PTR by kfree.  The complete
semantic patch that makes these changes is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ptr,e1,e2;
@@

- OBD_ALLOC(ptr,sizeof e1 * e2)
+ ptr = kcalloc(e2, sizeof e1, GFP_NOFS)

@@
expression ptr,e1,e2;
@@

- OBD_ALLOC_WAIT(ptr,sizeof e1 * e2)
+ ptr = kcalloc(sizeof e1, e2, GFP_KERNEL)

@@
expression ptr,e1,e2;
@@

- OBD_ALLOC(ptr,e2 * sizeof e1)
+ ptr = kcalloc(e2, sizeof e1, GFP_NOFS)

@@
expression ptr,e1,e2;
@@

- OBD_ALLOC_WAIT(ptr,e2 * sizeof e1)
+ ptr = kcalloc(e2, sizeof e1, GFP_KERNEL)

@@
expression ptr,e2;
type t;
@@

- OBD_ALLOC(ptr,sizeof (t) * e2)
+ ptr = kcalloc(e2, sizeof (t), GFP_NOFS)

@@
expression ptr,e2;
type t;
@@

- OBD_ALLOC_WAIT(ptr,sizeof (t) * e2)
+ ptr = kcalloc(e2, sizeof (t), GFP_KERNEL)

@@
expression ptr,e2;
type t;
@@

- OBD_ALLOC(ptr,e2 * sizeof (t))
+ ptr = kcalloc(e2, sizeof (t), GFP_NOFS)

@@
expression ptr,e2;
type t;
@@

- OBD_ALLOC_WAIT(ptr,e2 * sizeof (t))
+ ptr = kcalloc(e2, sizeof (t), GFP_KERNEL)

@@
expression ptr,e1,e2;
@@

- OBD_ALLOC(ptr,e1 * e2)
+ ptr = kcalloc(e1, e2, GFP_NOFS)

@@
expression ptr,e1,e2;
@@

- OBD_ALLOC_WAIT(ptr,e1 * e2)
+ ptr = kcalloc(e1, e2, GFP_KERNEL)

// -----------------------------------------------------------------------

@@
expression ptr,size;
@@

- OBD_ALLOC(ptr,size)
+ ptr = kzalloc(size, GFP_NOFS)

@@
expression ptr,size;
@@

- OBD_ALLOC_WAIT(ptr,size)
+ ptr = kzalloc(size, GFP_KERNEL)

@@
expression ptr;
@@

- OBD_ALLOC_PTR(ptr)
+ ptr = kzalloc(sizeof(*ptr), GFP_NOFS)

@@
expression ptr;
@@

- OBD_ALLOC_PTR_WAIT(ptr)
+ ptr = kzalloc(sizeof(*ptr), GFP_KERNEL)

// ----------------------------------------------------------------------

@@
expression ptr, size;
@@

- OBD_FREE(ptr, size);
+ kfree(ptr);

@@
expression ptr;
@@

- OBD_FREE_PTR(ptr);
+ kfree(ptr);
// </smpl>

