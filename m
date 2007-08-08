From: Paul Fulghum <paulkf@microgate.com>
Date: Wed, 08 Aug 2007 22:57:12 +0000
Subject: Re: [PATCH 55] drivers/char/n_hdlc.c: kmalloc + memset conversion
Message-Id: <46BA4A48.8060002@microgate.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707311845.48807.m.kozlowski@tuxland.pl>	<200707312327.30692.m.kozlowski@tuxland.pl>	<20070801011655.08e3c17b@the-village.bc.nu>	<200708080802.24635.m.kozlowski@tuxland.pl> <m3d4xx66xv.fsf@maximus.localdomain>
In-Reply-To: <m3d4xx66xv.fsf@maximus.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Mariusz Kozlowski <m.kozlowski@tuxland.pl>, Alan Cox <alan@lxorguk.ukuu.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

Krzysztof Halasa wrote:
> Mariusz Kozlowski <m.kozlowski@tuxland.pl> writes:
> 
>> Signed-off-by: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
>>
>>  drivers/char/n_hdlc.c | 27451 -> 27413 (-38 bytes)
>>  drivers/char/n_hdlc.o | 107068 -> 107088 (+20 bytes)
> 
> BTW: drivers/char/n_hdlc is a very different thing than these
> in drivers/net/wan/ and I have no connection with it. Not sure
> who is responsible, if anyone.

I am, my email is at the top of n_hdlc.c but there
is no maintainers entry.

--
Paul Fulghum
Microgate Systems, Ltd

