From: "Andrew F. Davis" <afd@ti.com>
Date: Thu, 25 May 2017 13:47:19 +0000
Subject: Re: [PATCH v2 1/1] w1: Add subsystem kernel public interface
Message-Id: <adfa6c6b-84b8-d652-c76b-04138e4248fb@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516200814.12360-1-afd@ti.com>
 <20170516200814.12360-2-afd@ti.com> <20170525130056.GB30447@kroah.com>
 <1399ebdb-337e-43b7-9e4d-a0c088bc8c7b@ti.com>
 <1499591495717767@web38g.yandex.ru>
 <299fe87d-d0fd-6f16-2f7e-ba56096e5021@ti.com>
 <1604131495718924@web38g.yandex.ru>
In-Reply-To: <1604131495718924@web38g.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy Polyakov <zbr@ioremap.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/25/2017 08:28 AM, Evgeniy Polyakov wrote:
> 
> 
> 25.05.2017, 16:22, "Andrew F. Davis" <afd@ti.com>:
> 
>>>  Why does BQ27xxx need to move out of w1 tree?
>>
>> Currently we have to enable a pseudo-platform device driver in the
>> power/supply BQ27xxx driver, then the w1 driver has to instantiate this
>> platform device and then they connect and communicate by sharing
>> callbacks. This is rather hacky.
> 
> Why do you have to create a pseudo-platform device driver to connect w1 and power/supply?
> 
> I'm not against creating w1 drivers in different places than drivers/w1, but so far
> it was only power drivers which have problem with it (and they easily work it out),
> and this rises a flag.
> 

We could keep it in w1 if we really wanted, but then things like Kconfig
will get difficult to manage (we will jump between menus and have odd
dependencies).

The other w1/slaves seem to mostly be simple EEPROMs and Gauges that
would otherwise end up in misc/ so it is fine if they live in w1, but
BQ27xxx does have a proper home in power/supplies and its i2c interface
is already there, so moving the w1 interface there also makes sense to me.

> I would rather move w1 header into include/linux, will it be enough?
> 

That's what this patch does, we just also re-organize things a bit so
only things that need to be public end up in include/linux. It seems to
be all that is needed for my use-case at least.
