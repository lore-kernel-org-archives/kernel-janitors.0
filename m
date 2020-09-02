From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 02 Sep 2020 11:48:40 +0000
Subject: Re: [PATCH] ACPI: sysfs: copy ACPI data using io memory copying
Message-Id: <6c8386dd-d1a9-fde1-2416-7c4560680d30@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200312111345.1057569-1-colin.king@canonical.com>
 <2440284.4js2fAD822@kreacher>
 <65817d75-7272-2ef3-33a5-f390b5b0ec30@canonical.com>
 <e94b289c3dfb4ac0b05a7134f9ae8bb3@AcuMS.aculab.com>
In-Reply-To: <e94b289c3dfb4ac0b05a7134f9ae8bb3@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Laight <David.Laight@ACULAB.COM>, "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Len Brown <lenb@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>

On 02/09/2020 12:13, David Laight wrote:
> From: Colin Ian King
>> Sent: 02 September 2020 11:27
>>
>> On 14/03/2020 10:23, Rafael J. Wysocki wrote:
>>> On Thursday, March 12, 2020 12:13:45 PM CET Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> Reading ACPI data on ARM64 at a non-aligned offset from
>>>> /sys/firmware/acpi/tables/data/BERT will cause a splat because
>>>> the data is I/O memory mapped and being read with just a memcpy.
>>>> Fix this by introducing an I/O variant of memory_read_from_buffer
>>>> and using I/O memory mapped copies instead.
> ..
>>>> +/**
>>>> + * memory_read_from_io_buffer - copy data from a io memory mapped buffer
>>>> + * @to: the kernel space buffer to read to
>>>> + * @count: the maximum number of bytes to read
>>>> + * @ppos: the current position in the buffer
>>>> + * @from: the buffer to read from
>>>> + * @available: the size of the buffer
>>>> + *
>>>> + * The memory_read_from_buffer() function reads up to @count bytes from the
>>>> + * io memory mappy buffer @from at offset @ppos into the kernel space address
>>>> + * starting at @to.
>>>> + *
>>>> + * On success, the number of bytes read is returned and the offset @ppos is
>>>> + * advanced by this number, or negative value is returned on error.
>>>> + **/
> 
> Apart from the return value how is this different from the generic
> memcpy_from_io() ?
> 
> 	David


The intention is to be semantically the same as
memory_read_from_buffer(), so in that respect quite a bit different from
memcpy_fromio()

Colin

> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 
