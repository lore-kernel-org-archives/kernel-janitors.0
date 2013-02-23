From: walter harms <wharms@bfs.de>
Date: Sat, 23 Feb 2013 18:13:19 +0000
Subject: Re: [PATCH 2/2] staging: comedi: drivers: usbduxfast.c: fix for DMA buffers on stack
Message-Id: <512906BF.5030308@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1361556450-32572-1-git-send-email-gmate.amit@gmail.com> <5127BFDB.4010608@bfs.de> <20130222190644.GA16011@kroah.com> <5128E76F.1000607@bfs.de> <20130223173442.GL9138@mwanda>
In-Reply-To: <20130223173442.GL9138@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Kumar Amit Mehta <gmate.amit@gmail.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Am 23.02.2013 18:34, schrieb Dan Carpenter:
> On Sat, Feb 23, 2013 at 04:59:43PM +0100, walter harms wrote:
>>>> or is it possible to pass one byte
>>>> in a register ? (aka char/int) without allocating ?
>>>
>>> Nope, the USB host controllers must be able to DMA to this memory
>>> location, so you have to allocate it dynamically, sorry.
>>>
>>> thanks,
>>
>> thx for clarification.
>>
>> @Kumar Amit Mehta:
>> Would you mind to add this as comment ? Allocating one byte does not
>> look clever so maybe will come up with the idea of changing that.
>>
> 
> That can't happen.  The reason is already recorded in the git
> history.  Greg and Ian know that DMA to stack memory doesn't work.
> Most maintainers know about that.  If someone changed it back then
> Fengguang would send an automatic email about it as soon as it was
> committed to a public git tree.
> 

I am not sure about that we talk about the same thing, i am thinking
about the "casual "reader" discovering a one-byte-malloc.
He will not check the githistory, he will thing "WTF there are doing here ?"

I will not make things more complicated, IMHO an malloc of one byte
is a strange thing and strange things should be commented in code.
If the maintainer says "no" i will survive.

re,
 wh

