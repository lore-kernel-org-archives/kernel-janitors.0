From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Tue, 08 Jul 2008 16:56:00 +0000
Subject: Re: [PATCH] drm_memory.h: remove double inclusion of linux/vmalloc.h
Message-Id: <a4423d670807080956m4aa548b7vf5557892aae81432@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a4423d670807060431w639f0b1ajcbad6471d50ef802@mail.gmail.com>
	 <919fe2b30807080529j71ae1816sc035c90b5eee555c@mail.gmail.com>
	 <20080708152225.GA9028@q7.q7.com>
In-Reply-To: <20080708152225.GA9028@q7.q7.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Romanick <ianr@q7.com>
Cc: Mark Asselstine <asselsm@gmail.com>, airlied@linux.ie, dri-devel@lists.sourceforge.net, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2008/7/8 Ian Romanick <ianr@q7.com>:
> On Tue, Jul 08, 2008 at 08:29:57AM -0400, Mark Asselstine wrote:
>> On Sun, Jul 6, 2008 at 7:31 AM, Alexander Beregalov
>> <a.beregalov@gmail.com> wrote:
>> > From: Alexander Beregalov <a.beregalov@gmail.com>
>> >
>> >  #if __OS_HAS_AGP
>> >
>> > -#include <linux/vmalloc.h>
>> > -
>>
>> Why remove this one and not the one at the top of the file? As well
>
> I would assume this one is removed because it is inside additional
> ifdefs.
Yes, it does not change functionality of the code.
>
>> this file has #include of drmP.h, yet drmP.h is the only file I can
>> find that includes drm_memory.h. Based on this I would think there is
>> some additional cleanup that can go on here.
How it can be cleaned up? Do you mean to move `define PAGE_AGP` to drmP.h?
