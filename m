From: Joe Perches <joe@perches.com>
Date: Fri, 25 Mar 2016 05:56:06 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: fix 'line over 80 characters'
Message-Id: <1458885366.29362.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160325024406.GA23833@SEL-JYOUN-D1>
	 <1458875989.3209.11.camel@perches.com>
	 <CAHb8M2BSuqmLw_4aOfEMhqckGczpF0ySmOrE9AhCq_18OqQCDw@mail.gmail.com>
In-Reply-To: <CAHb8M2BSuqmLw_4aOfEMhqckGczpF0ySmOrE9AhCq_18OqQCDw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: DaeSeok Youn <daeseok.youn@gmail.com>
Cc: Lidza Louina <lidza.louina@gmail.com>, Mark Hounschell <markh@compro.net>, Greg KH <gregkh@linuxfoundation.org>, "driverdev-devel@linuxdriverproject.org" <driverdev-devel@linuxdriverproject.org>, devel <devel@driverdev.osuosl.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Fri, 2016-03-25 at 14:42 +0900, DaeSeok Youn wrote:
> 2016-03-25 12:19 GMT+09:00 Joe Perches <joe@perches.com>:
> > On Fri, 2016-03-25 at 11:44 +0900, Daeseok Youn wrote:
> > > fix checkpatch.pl warning about 'line over 80 characters'
> > > in dgnc_neo.c
[]
> > > diff --git a/drivers/staging/dgnc/dgnc_neo.c b/drivers/staging/dgnc/dgnc_neo.c
[]
> > > @@ -116,7 +117,8 @@ static inline void neo_set_cts_flow_control(struct channel_t *ch)
> > >       writeb(efr, &ch->ch_neo_uart->efr);
> > > 
> > >       /* Turn on table D, with 8 char hi/low watermarks */
> > > -     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY), &ch->ch_neo_uart->fctr);
> > > +     writeb((UART_17158_FCTR_TRGD | UART_17158_FCTR_RTS_4DELAY),
> > > +             &ch->ch_neo_uart->fctr);
> > You could remove parentheses here around the CONST | CONST
> OK. I got it. but it also, I will send a patch after fixing this, not
> in this, right?

Right.

