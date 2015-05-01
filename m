From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 01 May 2015 20:52:37 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <CA8D4D3B-39CB-4DE4-835D-047692A7E5DE@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <20150501200221.GF14154@mwanda>
 <9f81478864bc422c9a59cddbaa723052@EXCHCS32.ornl.gov>
 <20150501204930.GB2265@kroah.com>
In-Reply-To: <20150501204930.GB2265@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Simmons, James A." <simmonsja@ornl.gov>, Dan Carpenter <dan.carpenter@oracle.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>


On May 1, 2015, at 4:49 PM, Greg Kroah-Hartman wrote:

> On Fri, May 01, 2015 at 08:36:05PM +0000, Simmons, James A. wrote:
>>> We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.
>>> 
>>> It's simple enough to write a function:
>>> 
>>> void *obd_zalloc(size_t size)
>>> {
>>> 	if (size > 4 * PAGE_CACHE_SIZE)
>>> 		return vzalloc(size);
>>> 	else
>>> 		return kmalloc(size, GFP_NOFS);
>>> }
>>> 
>>> Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
>>> There was some discussion of that GFP_NOFS was a bit buggy back in 2010
>>> (http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
>>> lustre code doesn't try to pass GFP_NOFS.
>> 
>> The version in the upstream client is out of date. The current macro in the Intel master
>> Branch is:
> 
> That's not helpful at all, why do we even have an in-kernel version of
> this code if you don't do your development in the kernel?
> 
> Please sync with the kernel tree very soon, or I'm just going to delete
> this whole thing.  This is getting _really_ frustrating.

The patch was submitted.
But it depends on a symbol that's not exported.
I was not able to change that.
http://www.spinics.net/lists/linux-mm/msg83997.html

Bye,
    Oleg