From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 25 May 2017 13:21:59 +0000
Subject: Re: [PATCH v2 1/1] w1: Add subsystem kernel public interface
Message-Id: <299fe87d-d0fd-6f16-2f7e-ba56096e5021@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516200814.12360-1-afd@ti.com>
 <20170516200814.12360-2-afd@ti.com> <20170525130056.GB30447@kroah.com>
 <1399ebdb-337e-43b7-9e4d-a0c088bc8c7b@ti.com>
 <1499591495717767@web38g.yandex.ru>
In-Reply-To: <1499591495717767@web38g.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/25/2017 08:09 AM, Evgeniy Polyakov wrote:
> Hi everyone
> 
> 25.05.2017, 16:07, "Andrew F. Davis" <afd@ti.com>:
> 
>>>  Do you have a patch that does that? I don't want to accept this patch
>>>  if that never happens...
>>
>> Yes, this reorganization stems from the need to move the BQ27xxx slave
>> out, patches were posted and reviewed last cycle here[0] and will be
>> reposted when this patch is accepted. Other w1/slaves can be moved out
>> at their owners convenience if/when they wish.
> 
> Why does BQ27xxx need to move out of w1 tree?
> 

Currently we have to enable a pseudo-platform device driver in the
power/supply BQ27xxx driver, then the w1 driver has to instantiate this
platform device and then they connect and communicate by sharing
callbacks. This is rather hacky.

Other buses USB, SPI, I2C, etc. allow the client device drivers to live
with the subsystem they for whose functionality they expose (e.g an I2C
attached temp sensor goes in drivers/hwmon, not drivers/i2c).

"Need" is a bit strong, but moving this out makes things a lot cleaner
and more consistent.

Andrew
