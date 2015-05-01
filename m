From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 01 May 2015 20:12:44 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <9C4D3E11-27BE-42F1-8AC7-9D8DC5D31F93@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <20150501200221.GF14154@mwanda>
In-Reply-To: <20150501200221.GF14154@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Simmons, James A." <simmonsja@ornl.gov>, Julia Lawall <Julia.Lawall@lip6.fr>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>


On May 1, 2015, at 4:02 PM, Dan Carpenter wrote:

> We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.
> 
> It's simple enough to write a function:
> 
> void *obd_zalloc(size_t size)
> {
> 	if (size > 4 * PAGE_CACHE_SIZE)
> 		return vzalloc(size);
> 	else
> 		return kmalloc(size, GFP_NOFS);

kzalloc here too. Except e also want to have locality of allocations.

> }
> 
> Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
> There was some discussion of that GFP_NOFS was a bit buggy back in 2010
> (http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
> lustre code doesn't try to pass GFP_NOFS.

The patch I submitted was rejected, or so I think to remember, because we use __vmalloc_node
or something and it's not an exported symbol.
http://www.spinics.net/lists/linux-mm/msg83997.html

> Then it's simple enough to change OBD_FREE_LARGE() to kvfree().
> 
> Also it's weird that only the lustre people have thought of this trick
> to allocate big chunks of RAM and no one else has.  What would happen if
> we just change vmalloc() so it worked this way for everyone?

We are certainly not alone.
I saw this in a few other pieces of code.

void *ext4_kvmalloc(size_t size, gfp_t flags)
{
        void *ret;

        ret = kmalloc(size, flags | __GFP_NOWARN);
        if (!ret)
                ret = __vmalloc(size, flags, PAGE_KERNEL);
        return ret;
}

or kmem_zalloc_large in xfs.

The difference at hand is that we pessimistically assume anything over certain threshold would
fail in kmalloc anyway and others actually do try kmalloc and only switch to vmalloc if kmaloc failed.
Considerign how expensive (and unsafe) vmalloc is, there might be some benefit to converting to their
way of doing things too.

Bye,
    Oleg