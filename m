From: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Date: Tue, 09 Oct 2012 10:30:01 +0000
Subject: RE: [remoteproc:for-next 6/9] remoteproc_virtio.c:(.text+0x238e7e): undefined reference to `vring_tr
Message-Id: <81C3A93C17462B4BBD7E272753C1057923BD9B59E3@EXDCVYMBSTM005.EQ1STM.local>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001024544.GA12711@localhost>
 <CAK=WgbakTOS71tvpQDLoANm25Ms_sbz1OcEqBuvO2+ZKwMBsmA@mail.gmail.com>
 <CAK=WgbYK2rFw7iFV1fGUb1saXrsH+yh=2Etmuj5+6ob6cCKntw@mail.gmail.com>
In-Reply-To: <CAK=WgbYK2rFw7iFV1fGUb1saXrsH+yh=2Etmuj5+6ob6cCKntw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ohad Ben-Cohen <ohad@wizery.com>, Fengguang Wu <fengguang.wu@intel.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Ohad,

> On Tue, Oct 2, 2012 at 10:24 AM, Ohad Ben-Cohen <ohad@wizery.com>
> wrote:
> > On Mon, Oct 1, 2012 at 4:45 AM, Fengguang Wu
> <fengguang.wu@intel.com> wrote:
> >> Hi Ohad,
> >>
> >> FYI, kernel build failed on
> >>
> >> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
> for-next
> >> head:   bec109a430e8c67bae1743f7e71898283234a77f
> >> commit: ec4d02d9180f407c41f8310a13b34e473c671fbb [6/9] remoteproc:
> Add STE modem driver
> >> config: i386-randconfig-b102 (attached as .config)
> >>
> >> It should be an old bug. The commit happen to be the one to trigger
> >> the errors because it selects CONFIG_EMOTEPROC.
> >
> > Thanks Fengguang.
> >
> > This should be fixed by a patch I pushed today to remoteproc's for-next
> branch.
> >
> > Though I wonder, Sjur, do we want to limit the architectures/platforms
> > where the STE modem driver can be selected on ? Is it ARM only perhaps ?
> 
> Can you please address the above question ?

Sorry for not responding sooner, but I thought this issue was solved with
your patch  "remoteproc: fix (again) the virtio-related build breakage"
(https://lkml.org/lkml/2012/10/6/85).

I'm not sure I understand why you would want to add a dependency to ARM.
But if you're uncomfortable by having STE_MODEM_RPROC directly selectable,
perhaps we could let it be selected by arch specific Kconfig files,  e.g. mach-ux500?

Regards,
Sjur

