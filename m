From: walter harms <wharms@bfs.de>
Date: Tue, 06 Mar 2012 08:44:04 +0000
Subject: Re: [patch v2] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <4F55CE54.4000300@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305180614.GA26880@elgon.mountain> <4F550917.9020508@bfs.de> <4F551504.5010401@zytor.com>
In-Reply-To: <4F551504.5010401@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 05.03.2012 20:33, schrieb H. Peter Anvin:
> On 03/05/2012 10:42 AM, walter harms wrote:
>>
>>
>> Am 05.03.2012 19:06, schrieb Dan Carpenter:
>>> "filename" is a efi_char16_t string so this check for reaching the end
>>> of the array doesn't work.  We need to cast the pointer to (u8 *) before
>>> doing the math.
>>>
>>> This patch changes the "filename" to "filename_16" to avoid confusion in
>>> the future.
>>>
>>
>> maybe it is a bit late,  but ...
>> is efi_char16_t a generic requirement for EFI ? perhaps we can use wchar_t
>> since it is intended for such cases. additional we would get an api for free.
>>
> 
> wchar_t is typically 32 bits on Linux.  16-bit anything is a major fail
> since Unicode doesn't actually fit in 16 bits.
> 
hi,

yep, but i was asking about efi. The basic idea is of cause to map efi_char16_t -> wchar_t
and back and make this a prototype for every driver that needs a special charset.
That would make it possible to recycle the wcs* interface of libc.
IMHO it seems more reasonable than adding one for each (upcoming) type.

re,
 wh
