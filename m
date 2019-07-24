From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 24 Jul 2019 18:38:48 +0000
Subject: Re: [v4 3/3] coccinelle: Add script to check for platform_get_irq() excessive prints
Message-Id: <3baa3e3c-c122-e868-55a0-597e279496ac@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190723181624.203864-4-swboyd@chromium.org>
 <c98b8f50-1adf-ea95-a91c-ec451e9fefe2@web.de>
 <5d38a1c3.1c69fb81.2b26a.b585@mx.google.com>
In-Reply-To: <5d38a1c3.1c69fb81.2b26a.b585@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Boyd <swboyd@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Nicolas Palix <nicolas.palix@imag.fr>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, Andrzej Hajda <a.hajda@samsung.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>, Russell King <linux@armlinux.org.uk>, Marek Szyprowski <m.szyprowski@samsung.com>

>>> +if (ret != -EPROBE_DEFER)
>>
>> Is it appropriate to treat this error code check as optional
>> by the shown transformation approach?
>> Can this case distinction be omitted?
>
> I don't know what you mean here.

I suggest to take another look at the importance and relevance
of this specific source code search detail (including SmPL disjunctions).


> Do you want me to drop this part so that EPROBE_DEFER checks don't get removed?

No, not at the moment. - But I am still looking for further clarification
of the desired software design.
So I am curious how a corresponding agreement will evolve.

Regards,
Markus
