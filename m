From: "Drokin, Oleg" <oleg.drokin@intel.com>
Date: Fri, 01 May 2015 21:13:11 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <C4CA2C71-C25D-42EB-AC52-963405EFE353@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr>
 <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr>
 <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov>
 <20150501200221.GF14154@mwanda>
 <9f81478864bc422c9a59cddbaa723052@EXCHCS32.ornl.gov>
 <20150501204930.GB2265@kroah.com>
 <CA8D4D3B-39CB-4DE4-835D-047692A7E5DE@intel.com>
 <20150501205835.GA2692@kroah.com>
In-Reply-To: <20150501205835.GA2692@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>, "Simmons, James A." <simmonsja@ornl.gov>, Dan Carpenter <dan.carpenter@oracle.com>


On May 1, 2015, at 4:58 PM, Greg Kroah-Hartman wrote:

> On Fri, May 01, 2015 at 08:52:37PM +0000, Drokin, Oleg wrote:
>> 
>> On May 1, 2015, at 4:49 PM, Greg Kroah-Hartman wrote:
>> 
>>> On Fri, May 01, 2015 at 08:36:05PM +0000, Simmons, James A. wrote:
>>>>> We are hopefully going to get rid of OBD_ALLOC_LARGE() as well, though.
>>>>> 
>>>>> It's simple enough to write a function:
>>>>> 
>>>>> void *obd_zalloc(size_t size)
>>>>> {
>>>>> 	if (size > 4 * PAGE_CACHE_SIZE)
>>>>> 		return vzalloc(size);
>>>>> 	else
>>>>> 		return kmalloc(size, GFP_NOFS);
>>>>> }
>>>>> 
>>>>> Except, huh?  Shouldn't we be using GFP_NOFS for the vzalloc() side?
>>>>> There was some discussion of that GFP_NOFS was a bit buggy back in 2010
>>>>> (http://marc.info/?l=linux-mm&m8942194520631&w=4) but the current
>>>>> lustre code doesn't try to pass GFP_NOFS.
>>>> 
>>>> The version in the upstream client is out of date. The current macro in the Intel master
>>>> Branch is:
>>> 
>>> That's not helpful at all, why do we even have an in-kernel version of
>>> this code if you don't do your development in the kernel?
>>> 
>>> Please sync with the kernel tree very soon, or I'm just going to delete
>>> this whole thing.  This is getting _really_ frustrating.
>> 
>> The patch was submitted.
>> But it depends on a symbol that's not exported.
>> I was not able to change that.
>> http://www.spinics.net/lists/linux-mm/msg83997.html
> 
> But you were given a hint on how to change that :)

Well, the hint amounted to "don't do vmalloc if you cannot live with the
GFP_KERNEL" allocations.

In any case once we unroll the OBD_ALLOC* (esp. the _LARGE ones), it should be possible
to go through those cases and adjust GFP flags to less restrictive where possible
(right now our macro is way too rigid and does not take gfp flags at all).

> Anyway, I'd recommend switching to what ext4 and xfs does, as you point
> out in another email in this thread, it looks a lot better overall.

Yes, I imagine Julia will include that as the new lustre_kvzalloc() define
to be used in all OBD_ALLOC_LARGE instances.
I can provide the desired code if necessary (it's actually a bit less than trivial
because in some cases we also have that numa-aware node thing).

though if we are ok to review that later, then almost a copy of ext4 one would do like this:
void *lustre_kvzalloc(size_t size, gfp_t flags)
{
       void *ret;

       ret = kzalloc(size, flags | __GFP_NOWARN);
       if (!ret)
               ret = __vmalloc(size, flags | __GFP_ZERO, PAGE_KERNEL);
       return ret;
}


Bye,
    Oleg