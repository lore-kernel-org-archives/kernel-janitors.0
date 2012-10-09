From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Oct 2012 13:28:47 +0000
Subject: Re: [remoteproc:for-next 6/9] remoteproc_virtio.c:(.text+0x238e7e): undefined reference to `vring_tr
Message-Id: <20121009132847.GC4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001024544.GA12711@localhost>
 <CAK=WgbakTOS71tvpQDLoANm25Ms_sbz1OcEqBuvO2+ZKwMBsmA@mail.gmail.com>
 <CAK=WgbYK2rFw7iFV1fGUb1saXrsH+yh=2Etmuj5+6ob6cCKntw@mail.gmail.com>
 <81C3A93C17462B4BBD7E272753C1057923BD9B59E3@EXDCVYMBSTM005.EQ1STM.local>
 <CAK=WgbaNHBVeF_A0jyNpRvnsO_BbkJGxKzyroC6pO1x+OELe0w@mail.gmail.com>
In-Reply-To: <CAK=WgbaNHBVeF_A0jyNpRvnsO_BbkJGxKzyroC6pO1x+OELe0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>
Cc: Sjur BRENDELAND <sjur.brandeland@stericsson.com>, Fengguang Wu <fengguang.wu@intel.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Oct 09, 2012 at 01:52:49PM +0200, Ohad Ben-Cohen wrote:
> Hi Sjur,
> 
> On Tue, Oct 9, 2012 at 12:30 PM, Sjur BRENDELAND
> <sjur.brandeland@stericsson.com> wrote:
> > Sorry for not responding sooner, but I thought this issue was solved with
> > your patch  "remoteproc: fix (again) the virtio-related build breakage"
> > (https://lkml.org/lkml/2012/10/6/85).
> >
> > I'm not sure I understand why you would want to add a dependency to ARM.
> > But if you're uncomfortable by having STE_MODEM_RPROC directly selectable,
> > perhaps we could let it be selected by arch specific Kconfig files,  e.g. mach-ux500?
> 
> I would just like the Kconfig dependencies to reflect the "real world":
> 
> E.g., if there's no chance the STE modem is going to be used on x86,
> then let's not ask x86 folks about it.
> 
> Does limiting the STE modem to certain platform/architectures make
> sense ? (if not, that's ok)
> 

Unless there is a good reason why then we shouldn't put arbitrary
limits like that.  If we leave it in people at least run static
analyzers on it and try modprobing it.

regards,
dan carpenter

