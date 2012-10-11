From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Thu, 11 Oct 2012 18:49:16 +0000
Subject: RE: [remoteproc:for-next 6/9] remoteproc_virtio.c:(.text+0x238e7e): undefined reference to `vring_tr
Message-Id: <81C3A93C17462B4BBD7E272753C1057923BDA378AB@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001024544.GA12711@localhost>
 <CAK=WgbakTOS71tvpQDLoANm25Ms_sbz1OcEqBuvO2+ZKwMBsmA@mail.gmail.com>
 <CAK=WgbYK2rFw7iFV1fGUb1saXrsH+yh=2Etmuj5+6ob6cCKntw@mail.gmail.com>
 <81C3A93C17462B4BBD7E272753C1057923BD9B59E3@EXDCVYMBSTM005.EQ1STM.local>
 <CAK=WgbaNHBVeF_A0jyNpRvnsO_BbkJGxKzyroC6pO1x+OELe0w@mail.gmail.com>
 <20121009132847.GC4587@mwanda>
 <CAK=WgbadhpEaP=ObM8rT=+xnEmh3xzb_ORThDfutH+jDOCf2mQ@mail.gmail.com>
 <20121009142644.GD4587@mwanda>
 <CAK=WgbbV9K-SFbwukDwTAnOBTtwaBUH422Da+CmdvXCN86-aMw@mail.gmail.com>
In-Reply-To: <CAK=WgbbV9K-SFbwukDwTAnOBTtwaBUH422Da+CmdvXCN86-aMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Fengguang Wu <fengguang.wu@intel.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?iso-8859-1?Q?Sjur_Br=E6ndeland?= <sjurbren@gmail.com>

> From: Ohad Ben-Cohen [mailto:ohad@wizery.com] Sent: 9. oktober 2012 16:39
> On Tue, Oct 9, 2012 at 4:26 PM, Dan Carpenter
>
> <dan.carpenter@oracle.com> wrote:
>> If it already compiles fine on x86 then there is no advantage to
>> disabling it.
> 
> Not really; that's really a hardware question and not a software one.
> 
> There are hardware devices that can go with any platform/architecture,
> e.g., WLAN chips. OTOH, there are a lot of hardware devices that are
> coupled with certain SoC, e.g. OMAP's remote processors.
> 
> What I'm trying to understand is whether the STE modem device belongs
> to the former or latter group. It sounds like a modem belongs to the
> former group, but if it does belong to the latter, then the building
> of its driver should be possible only on the relevant
> platforms/architectures.

This driver is intended for NovaThor SoC and for a configuration with
LLI as the shared memory interface between the host and modem.
When using LLI as the shared memory interface the modem could be used
with any platform/architecture with little endian byte sex and a LLI
interface. So I guess this driver belongs in the former group you
mention, and should probably not be dependent on ARM only.

Thanks,
Sjur

