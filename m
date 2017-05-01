From: "Andrew F. Davis" <afd@ti.com>
Date: Mon, 01 May 2017 17:36:26 +0000
Subject: Re: [PATCH 3/3] w1: Add subsystem kernel public interface
Message-Id: <e2cfddfe-f56b-1b83-eaa6-bb24067889b8@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170316151955.10710-1-afd@ti.com>
 <20170316151955.10710-4-afd@ti.com> <5478321493483316@web21g.yandex.ru>
In-Reply-To: <5478321493483316@web21g.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 04/29/2017 11:28 AM, Evgeniy Polyakov wrote:
> Hi everyone
> 
> 16.03.2017, 18:20, "Andrew F. Davis" <afd@ti.com>:
>> Like other subsystems we should be able to define slave devices outside
>> of the w1 directory. To do this we move public facing interface
>> definitions to include/linux/w1.h and rename the internal definition
>> file to w1_internal.h.
>>
>> As w1_family.h and w1_int.h contained almost entirely public
>> driver interface definitions we simply removed these files and
>> moved the remaining definitions into w1_internal.h.
> 
> w1_int.h was a shortname for w1_internal.h actually
> 
>> With this we can now start to move slave devices out of w1/slaves and
>> into the subsystem based on the function they implement, again like
>> other drivers.
> 
> I'm not against this patch per-se, I especially like linux/w1 include instead of ../w1.h,
> quite curious why didn't I move include file into linux directory in the first place,
> but please elaborate why is this needed?
> 

I'm moving the bq27xxx driver out of w1 and into power/supply where it
should be, see:
https://lkml.org/lkml/2017/3/16/688

> Also I do not agree with TI copyright in the new inclusion file which is merely a movement of the old file.
> 

There is more going on that just moving the file, this was a lot of
re-work, also I kept your copyright, is it a problem to add another? If
so I'm fine with that too and can remove it.

Andrew
