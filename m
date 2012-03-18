From: walter harms <wharms@bfs.de>
Date: Sun, 18 Mar 2012 14:33:57 +0000
Subject: Re: [patch v2] x86, efi: fix pointer math issue in handle_ramdisks()
Message-Id: <4F65F255.5070504@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120305180614.GA26880@elgon.mountain> <4F550917.9020508@bfs.de> <4F551504.5010401@zytor.com> <4F55CE54.4000300@bfs.de> <4F639AB0.7010208@zytor.com>
In-Reply-To: <4F639AB0.7010208@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, x86@kernel.org, Matt Fleming <matt.fleming@intel.com>, Maarten Lankhorst <m.b.lankhorst@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 16.03.2012 20:55, schrieb H. Peter Anvin:
> On 03/06/2012 12:44 AM, walter harms wrote:
>>>
>> hi,
>>
>> yep, but i was asking about efi. The basic idea is of cause to map efi_char16_t -> wchar_t
>> and back and make this a prototype for every driver that needs a special charset.
>> That would make it possible to recycle the wcs* interface of libc.
>> IMHO it seems more reasonable than adding one for each (upcoming) type.
>>
> 
> Actually libc and the C standard is going the opposite ways, adding new
> interfaces for UTF-16 and UTF-32.  The wchar_t interface just doesn't
> work very well.
> 

I admit i do not have the problem yet and i do not like the idea adding even more types.
Oh well may i should be happy that someone is actually thinking about this here and not
simply add yet on other hot fix.

re,
 wh
