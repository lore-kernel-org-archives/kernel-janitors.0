From: Johan Hovold <johan@kernel.org>
Date: Mon, 27 Nov 2017 13:06:10 +0000
Subject: Re: [PATCH] USB: serial: iuu_phoenix: remove redundant assignment of DIV to itself
Message-Id: <20171127130610.GE9862@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171120174015.7191-1-colin.king@canonical.com>
 <5A1337DF.2060404@bfs.de>
In-Reply-To: <5A1337DF.2060404@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Colin King <colin.king@canonical.com>, Johan Hovold <johan@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Nov 20, 2017 at 09:15:27PM +0100, walter harms wrote:
> Am 20.11.2017 18:40, schrieb Colin King:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The assignment of DIV to itself is redundant and can be removed.
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  drivers/usb/serial/iuu_phoenix.c | 1 -
> >  1 file changed, 1 deletion(-)
> > 
> > diff --git a/drivers/usb/serial/iuu_phoenix.c b/drivers/usb/serial/iuu_phoenix.c
> > index 397a8012ffa3..62c91e360baf 100644
> > --- a/drivers/usb/serial/iuu_phoenix.c
> > +++ b/drivers/usb/serial/iuu_phoenix.c
> > @@ -472,7 +472,6 @@ static int iuu_clk(struct usb_serial_port *port, int dwFrq)
> >  				}
> >  	}
> >  	P2 = ((P - PO) / 2) - 4;
> > -	DIV = DIV;
> >  	PUMP = 0x04;
> >  	PBmsb = (P2 >> 8 & 0x03);
> >  	PBlsb = P2 & 0xFF;
> 
> These all all-upper-case stuff makes me a bit nervous. Normally this
> is reserved for #define ( I assume that the programmer refers to
> the original documentation) a point to change ?

Yeah, this isn't pretty and appears to have been copied directly from
the iuutool userspace tool (mentioned in the header).

> btw: i noticed  int frq = (int)dwFrq;
> since dwFrq is already an in, the cast is useless.

Indeed. Also present in original code.

This driver went in marked as "experimental", but the dependency on
CONFIG_EXPERIMENTAL was later dropped. These days something like this
would have need to be cleaned up (e.g. in staging) before getting
merged.

Johan
