From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Thu, 11 Oct 2012 21:08:38 +0000
Subject: Re: [remoteproc:for-next 6/9] remoteproc_virtio.c:(.text+0x238e7e): undefined reference to `vring_tr
Message-Id: <CAK=WgbYCu3HtdU3sjWfDf0aEXKyOhm4e7PE6YD-JcXWJAtDPow@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121001024544.GA12711@localhost> <CAK=WgbakTOS71tvpQDLoANm25Ms_sbz1OcEqBuvO2+ZKwMBsmA@mail.gmail.com>
 <CAK=WgbYK2rFw7iFV1fGUb1saXrsH+yh=2Etmuj5+6ob6cCKntw@mail.gmail.com>
 <81C3A93C17462B4BBD7E272753C1057923BD9B59E3@EXDCVYMBSTM005.EQ1STM.local>
 <CAK=WgbaNHBVeF_A0jyNpRvnsO_BbkJGxKzyroC6pO1x+OELe0w@mail.gmail.com>
 <20121009132847.GC4587@mwanda> <CAK=WgbadhpEaP=ObM8rT=+xnEmh3xzb_ORThDfutH+jDOCf2mQ@mail.gmail.com>
 <20121009142644.GD4587@mwanda> <CAK=WgbbV9K-SFbwukDwTAnOBTtwaBUH422Da+CmdvXCN86-aMw@mail.gmail.com>
 <81C3A93C17462B4BBD7E272753C1057923BDA378AB@EXDCVYMBSTM005.EQ1STM.local>
In-Reply-To: <81C3A93C17462B4BBD7E272753C1057923BDA378AB@EXDCVYMBSTM005.EQ1STM.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sjur BRENDELAND <sjur.brandeland@stericsson.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Fengguang Wu <fengguang.wu@intel.com>, "Linus Walleij (linus.walleij@linaro.org)" <linus.walleij@linaro.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?ISO-8859-1?Q?Sjur_Br=E6ndeland?= <sjurbren@gmail.com>

On Thu, Oct 11, 2012 at 8:49 PM, Sjur BRENDELAND
<sjur.brandeland@stericsson.com> wrote:
> This driver is intended for NovaThor SoC and for a configuration with
> LLI as the shared memory interface between the host and modem.
> When using LLI as the shared memory interface the modem could be used
> with any platform/architecture with little endian byte sex and a LLI
> interface. So I guess this driver belongs in the former group you
> mention, and should probably not be dependent on ARM only.

Ok, thanks for the information.

Ohad.
