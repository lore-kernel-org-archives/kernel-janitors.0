From: "H. Peter Anvin" <hpa@zytor.com>
Date: Mon, 05 Mar 2012 19:33:24 +0000
Subject: Re: [patch v2] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <4F551504.5010401@zytor.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305180614.GA26880@elgon.mountain> <4F550917.9020508@bfs.de>
In-Reply-To: <4F550917.9020508@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms@bfs.de
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 03/05/2012 10:42 AM, walter harms wrote:
> 
> 
> Am 05.03.2012 19:06, schrieb Dan Carpenter:
>> "filename" is a efi_char16_t string so this check for reaching the end
>> of the array doesn't work.  We need to cast the pointer to (u8 *) before
>> doing the math.
>>
>> This patch changes the "filename" to "filename_16" to avoid confusion in
>> the future.
>>
> 
> maybe it is a bit late,  but ...
> is efi_char16_t a generic requirement for EFI ? perhaps we can use wchar_t
> since it is intended for such cases. additional we would get an api for free.
> 

wchar_t is typically 32 bits on Linux.  16-bit anything is a major fail
since Unicode doesn't actually fit in 16 bits.

	-hpa

