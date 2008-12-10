From: "Vorobiev Dmitri" <dmitri.vorobiev@movial.fi>
Date: Wed, 10 Dec 2008 18:03:56 +0000
Subject: Re: [PATCH 1/28] drivers/base/platform.c: Drop return value from
Message-Id: <45755.88.114.236.15.1228932236.squirrel@webmail.movial.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812101725540.21998@ask.diku.dk>
    <20081210163819.17cf4628@lxorguk.ukuu.org.uk>
In-Reply-To: <20081210163819.17cf4628@lxorguk.ukuu.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Julia Lawall <julia@diku.dk>, dmitri.vorobiev@movial.fi, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> On Wed, 10 Dec 2008 17:26:26 +0100 (CET)
> Julia Lawall <julia@diku.dk> wrote:
>
>> From: Julia Lawall <julia@diku.dk>
>>
>> The return value of the remove function of a driver structure, and thus
>> of
>> a platform_driver structure, is ultimately ignored
>
> Currently

Are there really any plans about actually using the return value?

>
>> and is thus unnecessary.
>
> Really - capturing those kind of failures is useful information which is
> currently discarded but could later be used. Removing that information
> makes it very hard to go and put back into all the drivers.

The overwhelming majority of platform drivers do not return anything
meaningful from their remove() callbacks. So, it looked like void is
appropriate here in the same manner as, for example, the module exit
functions are void.

Let me please shed some light on the history of this patchset. It all
began when I sent a benign one-liner to shut up an annoying compiler
warning:

http://marc.info/?l=linux-scsi&m2714044609103&w=2

It was immediately noticed that the return value of the remove() callback
is actually ignored in the drivers/base/ code:

http://marc.info/?l=linux-scsi&m2832419623402&w=2

So, the idea of converting the drivers from int (*remove)() to void
(*remove)() was born.

Then, Julia decided to use her semantic patch tool, which looked very
appropriate for this kind of change: conversion of int-returning remove()
callbacks to void callbacks. We asked Greg Kroah-Hartman for his opinion
about the exact way to proceed here, and this is what he suggested
off-list:

<<<

You can do a "migration" type change:
        - create a new callback function pointer that returns void
        - start moving code over to the new callback
        - when finished, delete the old callback
        - create a new callback with the same old name, that returns
          void
        - move the code to use the new name.

Yeah, it's a pain, but it can be done in an incremental way.

thanks,

greg k-h

<<<

The patchset is therefore the first step in the direction of the API cleanup.

So, maybe this background info would help the reviewers somehow.

Thanks,
Dmitri Vorobiev

