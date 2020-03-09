From: Joe Perches <joe@perches.com>
Date: Mon, 09 Mar 2020 23:12:24 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
Message-Id: <69ed8a468b3e4776d277292a2e4b2f9b3c266f23.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
         <CABXOdTcrxoBCz24Ap=YJYZnr+oLAmaR10xZ9ar2mYbE1=RAoug@mail.gmail.com>
         <5129f7dbd8506cc9fd5a8f76dc993d789566af6c.camel@perches.com>
         <alpine.DEB.2.21.2003090702440.3325@felia>
         <20200309070534.GA4093795@kroah.com>
         <alpine.DEB.2.21.2003092035300.2953@felia>
In-Reply-To: <alpine.DEB.2.21.2003092035300.2953@felia>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Guenter Roeck <groeck@google.com>, Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, 2020-03-09 at 22:03 +0100, Lukas Bulwahn wrote:
> I am starting with the "bigger" clustered files in drivers, and then try 
> > > to look at files in include and Documentation/ABI/.

If you want to spend the time tracking stuff down,
it may be best to to
start with include/

> > > Here is a rough statistics on how many files from each directory are in
> > > THE REST:
> > > 
> > >    1368 include

There are very likely some files there that should
actually be listed as part of a subsystem.

> > >     327 lib

Not many that aren't trivial or ancient.

> > >     321 Documentation

Probably a few

> > >     100 drivers

What's not already maintained is probably ancient.

Everything else may not matter much.
