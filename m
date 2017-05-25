From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 25 May 2017 13:07:50 +0000
Subject: Re: [PATCH v2 1/1] w1: Add subsystem kernel public interface
Message-Id: <1399ebdb-337e-43b7-9e4d-a0c088bc8c7b@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516200814.12360-1-afd@ti.com>
 <20170516200814.12360-2-afd@ti.com> <20170525130056.GB30447@kroah.com>
In-Reply-To: <20170525130056.GB30447@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/25/2017 08:00 AM, Greg Kroah-Hartman wrote:
> On Tue, May 16, 2017 at 03:08:14PM -0500, Andrew F. Davis wrote:
>> Like other subsystems we should be able to define slave devices outside
>> of the w1 directory. To do this we move public facing interface
>> definitions to include/linux/w1.h and rename the internal definition
>> file to w1_internal.h.
>>
>> As w1_family.h and w1_int.h contained almost entirely public
>> driver interface definitions we simply removed these files and
>> moved the remaining definitions into w1_internal.h.
>>
>> With this we can now start to move slave devices out of w1/slaves and
>> into the subsystem based on the function they implement, again like
>> other drivers.
> 
> Do you have a patch that does that?  I don't want to accept this patch
> if that never happens...
> 

Yes, this reorganization stems from the need to move the BQ27xxx slave
out, patches were posted and reviewed last cycle here[0] and will be
reposted when this patch is accepted. Other w1/slaves can be moved out
at their owners convenience if/when they wish.

Thanks,
Andrew

[0] https://lkml.org/lkml/2017/3/16/688

> thanks,
> 
> greg k-h
> 
