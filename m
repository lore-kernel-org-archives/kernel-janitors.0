From: James Morse <james.morse@arm.com>
Date: Wed, 01 Apr 2020 12:44:34 +0000
Subject: Re: [PATCH][V2] ACPI: sysfs: copy ACPI data using io memory copying
Message-Id: <698da6fc-3334-5420-5c97-4406914e4599@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200317165409.469013-1-colin.king@canonical.com>
 <20200320131951.GA6555@lakrids.cambridge.arm.com>
In-Reply-To: <20200320131951.GA6555@lakrids.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Rutland <mark.rutland@arm.com>, Colin King <colin.king@canonical.com>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, lorenzo.pieralisi@arm.com

Hello!

On 3/20/20 1:19 PM, Mark Rutland wrote:
> [adding James and Lorenzo]

(but not actually...)


> On Tue, Mar 17, 2020 at 04:54:09PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Reading ACPI data on ARM64 at a non-aligned offset from
>> /sys/firmware/acpi/tables/data/BERT will cause a splat because
>> the data is I/O memory mapped

On your platform, on someone else's it may be in memory.

Which platform is this on?
(I've never seen one generate a BERT!)


>> and being read with just a memcpy.
>> Fix this by introducing an I/O variant of memory_read_from_buffer
>> and using I/O memory mapped copies instead.

> Just to check, is that correct is it correct to map those tables with
> Device attributes in the first place, or should we be mapping the tables
> with Normal Cacheable attributes with memremap()?
> 
> If the FW placed those into memory using cacheavble attributes, reading
> them using Device attributes could result in stale values, which could
> be garbage.

Yes. The BERT code should be using arch_apei_get_mem_attribute() to use the
correct attributes. See ghes_map() for an example. bert_init() will need to use
a version of ioremap() that takes the pgprot_t.

Always using ioremap_cache() means you get a cacheable mapping, regardless of
how firmware described this region in the UEFI memory map. This doesn't explain
why you got an alignment fault.

Otherwise, looks fine to me.


(N.B. I ignored this patch as it wasn't copied to linux-arm-kernel and the
subject says its about sysfs<->ACPI, nothing to do with APEI!)


Thanks,

James
