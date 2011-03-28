From: David Miller <davem@davemloft.net>
Date: Mon, 28 Mar 2011 23:53:11 +0000
Subject: Re: [PATCH 2/2 v2] tg3: Don't use IRQF_SAMPLE_RANDOM
Message-Id: <20110328.165311.226778266.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301315152.3182.19.camel@edumazet-laptop>
	<AANLkTi=Qkf2qn6nQ-6AXE8LtFSD++=eZRxa6ND6KPsk1@mail.gmail.com>
	<1301332822.2716.12.camel@bwh-desktop>
In-Reply-To: <1301332822.2716.12.camel@bwh-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bhutchings@solarflare.com
Cc: martinez.javier@gmail.com, eric.dumazet@gmail.com, error27@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Ben Hutchings <bhutchings@solarflare.com>
Date: Mon, 28 Mar 2011 18:20:22 +0100

> On Mon, 2011-03-28 at 17:46 +0200, Javier Martinez Canillas wrote:
>> Yes this definitely is not janitor material :)
>> 
>> I just sent the patch because I saw IRQF_SAMPLE_RANDOM in
>> Documentation/feature-removal-schedule.txt. I can resend a patch
>> removing the macro in the remaining network cards if the decision is
>> to remove IRQF_SAMPLE_RANDOM.
> 
> It's not my call, but I would support it.

FWIW, I support it too.
