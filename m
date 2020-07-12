From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 12 Jul 2020 06:40:28 +0000
Subject: Re: [PATCH] net: sky2: switch from 'pci_' to 'dma_' API
Message-Id: <a0d0ad2b-8b21-3842-cf2b-1d46274bbe7a@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200711204944.259152-1-christophe.jaillet@wanadoo.fr>
 <2181026e68d2948c396cc7a7b6bfb7146c1cd5f6.camel@perches.com>
 <8a3e5514-9cc9-18f3-9a98-81007419a20a@wanadoo.fr>
 <866325009f9ae73b3a563dd745f901260a372242.camel@perches.com>
In-Reply-To: <866325009f9ae73b3a563dd745f901260a372242.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>, mlindner@marvell.com, stephen@networkplumber.org, davem@davemloft.net, kuba@kernel.org, hch@infradead.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 12/07/2020 à 08:32, Joe Perches a écrit :
> On Sun, 2020-07-12 at 08:29 +0200, Christophe JAILLET wrote:
>> Le 11/07/2020 à 23:20, Joe Perches a écrit :
>>> On Sat, 2020-07-11 at 22:49 +0200, Christophe JAILLET wrote:
>>>> The wrappers in include/linux/pci-dma-compat.h should go away.
>>> why?
>>>
>>>
>>   From Christoph Hellwig
>> https://marc.info/?l=kernel-janitors&m8745678307186&w=4
> There's no why there.
> There's just an assertion a wrapper should "go away".
>
> "the wrappers in include/linux/pci-dma-compat.h should go away"
>
> wrappers aren't all bad.
>
>
Adding Christoph Hellwig to shed some light.

CJ
