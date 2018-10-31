From: Joe Perches <joe@perches.com>
Date: Wed, 31 Oct 2018 18:05:19 +0000
Subject: Re: [PATCH] tlclk: lean an indentation issue, remove extraneous tabs
Message-Id: <0a6d5b7a21d4ad5b29295ac5695ada3d9f2133c4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181030115650.21104-1-colin.king@canonical.com>
         <aa09c138-854e-ad84-59eb-5613b8cd3f0e@canonical.com>
In-Reply-To: <aa09c138-854e-ad84-59eb-5613b8cd3f0e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Mark Gross <mark.gross@intel.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2018-10-30 at 11:57 +0000, Colin Ian King wrote:
> $SUBJECT should be:
> 
> tlclk: clean an indentation issue, remove extraneous tabs

Perhaps add missing braces for the last else uses as well?

> On 30/10/2018 11:56, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
[]
> > diff --git a/drivers/char/tlclk.c b/drivers/char/tlclk.c
[]
> > +	if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
> > +		SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x28);
> > +		SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
> > +	} else if (val >= CLK_8_592MHz) {
> > +		SET_PORT_BITS(TLCLK_REG3, 0xc7, 0x38);
> > +		switch (val) {
> > +		case CLK_8_592MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
> > +			break;
> > +		case CLK_11_184MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
> > +			break;
> > +		case CLK_34_368MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
> > +			break;
> > +		case CLK_44_736MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);.
> > +			break;
> > +		}
> > +	} else
> > +		SET_PORT_BITS(TLCLK_REG3, 0xc7, val << 3);

here.

> > @@ -548,27 +548,27 @@ static ssize_t store_select_amcb1_transmit_clock(struct device *d,
[]
> > +	if ((val = CLK_8kHz) || (val = CLK_16_384MHz)) {
> > +		SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x5);
> > +		SET_PORT_BITS(TLCLK_REG1, 0xfb, ~val);
> > +	} else if (val >= CLK_8_592MHz) {
> > +		SET_PORT_BITS(TLCLK_REG3, 0xf8, 0x7);
> > +		switch (val) {
> > +		case CLK_8_592MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 2);
> > +			break;
> > +		case CLK_11_184MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 0);
> > +			break;
> > +		case CLK_34_368MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 3);
> > +			break;
> > +		case CLK_44_736MHz:
> > +			SET_PORT_BITS(TLCLK_REG0, 0xfc, 1);
> > +			break;
> > +		}
> > +	} else
> > +		SET_PORT_BITS(TLCLK_REG3, 0xf8, val);

and here.
