From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Fri, 01 May 2015 20:36:05 +0000
Subject: RE: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <9f81478864bc422c9a59cddbaa723052@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <20150501200221.GF14154@mwanda>
In-Reply-To: <20150501200221.GF14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>
Cc: 'Julia Lawall' <Julia.Lawall@lip6.fr>, Oleg Drokin <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

>We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.
>
>It's simple enough to write a function:
>
>void *obd_zalloc(size_t size)
>{
>	if (size > 4 * PAGE_CACHE_SIZE)
>		return vzalloc(size);
>	else
>		return kmalloc(size, GFP_NOFS);
>}
>
>Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
>There was some discussion of that GFP_NOFS was a bit buggy back in 2010
>(http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
>lustre code doesn't try to pass GFP_NOFS.

The version in the upstream client is out of date. The current macro in the Intel master
Branch is:

#define __OBD_VMALLOC_VERBOSE(ptr, cptab, cpt, size)                          \
do {                                                                          \
        (ptr) = cptab = NULL ?                                               \
                __vmalloc(size, GFP_NOFS | __GFP_HIGHMEM | __GFP_ZERO,        \
                          PAGE_KERNEL) :                                      \
                cfs_cpt_vzalloc(cptab, cpt, size);                            \
        if (unlikely((ptr) = NULL)) {                                        \
                CERROR("vmalloc of '" #ptr "' (%d bytes) failed\n",           \
                       (int)(size));                                          \
                CERROR(LPU64" total bytes allocated by Lustre, %d by LNET\n", \
                       obd_memory_sum(), atomic_read(&libcfs_kmemory));       \
        } else {                                                              \
                OBD_ALLOC_POST(ptr, size, "vmalloced");                       \
        }                                                                     \
} while(0)
 
>Then it's simple enough to change OBD_FREE_LARGE() to kvfree().
>
>Also it's weird that only the lustre people have thought of this trick
>to allocate big chunks of RAM and no one else has.  What would happen if
>we just change vmalloc() so it worked this way for everyone?

Do we really want to encourage vmalloc usages?
