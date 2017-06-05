From: "Andrew F. Davis" <afd@ti.com>
Date: Mon, 05 Jun 2017 13:57:01 +0000
Subject: Re: [PATCH v2 1/1] w1: Add subsystem kernel public interface
Message-Id: <62ab04d3-a648-01d1-ae0e-aa2e79b08f9a@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516200814.12360-1-afd@ti.com>
 <20170516200814.12360-2-afd@ti.com> <20170603102233.GA19112@kroah.com>
In-Reply-To: <20170603102233.GA19112@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 06/03/2017 05:22 AM, Greg Kroah-Hartman wrote:
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
>>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Reviewed-by: Sebastian Reichel <sre@kernel.org>
> 
> This breaks the build for me:
>   CC [M]  drivers/power/supply/ds2760_battery.o
> drivers/power/supply/ds2760_battery.c:31:10: fatal error: ../../w1/w1.h: No such file or directory
>  #include "../../w1/w1.h"
>           ^~~~~~~~~~~~~~~
> compilation terminated.
> 
> 
> So there was w1 drivers outside of the drivers/w1/ directory :)
> 

Seems these drivers are like the BQ27xxx I'm trying to fix-up, these are
platform drivers that connect with the real driver in w1/. Must have
missed my search.

> Please fix and resend.
> 

Fix sent in v3.

Thanks,
Andrew

> thanks,
> 
> greg k-h
> 
