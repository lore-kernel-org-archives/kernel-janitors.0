From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 May 2015 20:02:21 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <20150501200221.GF14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
In-Reply-To: <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Simmons, James A." <simmonsja@ornl.gov>
Cc: 'Julia Lawall' <Julia.Lawall@lip6.fr>, Oleg Drokin <oleg.drokin@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>

We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.

It's simple enough to write a function:

void *obd_zalloc(size_t size)
{
	if (size > 4 * PAGE_CACHE_SIZE)
		return vzalloc(size);
	else
		return kmalloc(size, GFP_NOFS);
}

Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
There was some discussion of that GFP_NOFS was a bit buggy back in 2010
(http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
lustre code doesn't try to pass GFP_NOFS.

Then it's simple enough to change OBD_FREE_LARGE() to kvfree().

Also it's weird that only the lustre people have thought of this trick
to allocate big chunks of RAM and no one else has.  What would happen if
we just change vmalloc() so it worked this way for everyone?

regards,
dan carpenter
