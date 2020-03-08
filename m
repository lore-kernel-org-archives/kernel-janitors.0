From: Joe Perches <joe@perches.com>
Date: Sun, 08 Mar 2020 22:54:47 +0000
Subject: Re: [PATCH RFC] MAINTAINERS: include GOOGLE FIRMWARE entry
Message-Id: <5129f7dbd8506cc9fd5a8f76dc993d789566af6c.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200308195116.12836-1-lukas.bulwahn@gmail.com>
         <CABXOdTcrxoBCz24Ap=YJYZnr+oLAmaR10xZ9ar2mYbE1=RAoug@mail.gmail.com>
In-Reply-To: <CABXOdTcrxoBCz24Ap=YJYZnr+oLAmaR10xZ9ar2mYbE1=RAoug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <groeck@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, Guenter Roeck <groeck@chromium.org>, Julius Werner <jwerner@chromium.org>, kernel-janitors@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Sun, 2020-03-08 at 15:32 -0700, Guenter Roeck wrote:
> On Sun, Mar 8, 2020 at 12:51 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > All files in drivers/firmware/google/ are identified as part of THE REST
> > according to MAINTAINERS, but they are really maintained by others.
[]
> > diff --git a/MAINTAINERS b/MAINTAINERS
[]
> > @@ -7111,6 +7111,14 @@ S:       Supported
> >  F:     Documentation/networking/device_drivers/google/gve.rst
> >  F:     drivers/net/ethernet/google
> > 
> > +GOOGLE FIRMWARE
> > +M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > +M:     Stephen Boyd <swboyd@chromium.org>
> > +R:     Guenter Roeck <groeck@chromium.org>
> > +R:     Julius Werner <jwerner@chromium.org>
> > +S:     Maintained
> > +F:     drivers/firmware/google/
> > +
> 
> FWIW, I would not mind stepping up as maintainer if needed, but I
> think we should strongly discourage this kind of auto-assignment of
> maintainers and/or reviewers.

Auto assignment should definitely _not_ be done.

This is an RFC proposal though.

Sometimes it's better to not produce an RFC as
a patch, but maybe just show a proposed section
and ask if is appropriate may be a better style
going forward.

Maybe just emailing Greg, Stephen, Guenter and
Julius (cc'ing LKML) asking something like the
below would be better:

----------------------------------------------------

Hey all.

Files in drivers/firmware/google/ do not seem to
have a listed MAINTAINER.

Would a section entry in MAINTAINERS like this be
appropriate?

GOOGLE FIRMWARE
M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
M:     Stephen Boyd <swboyd@chromium.org>
R:     Guenter Roeck <groeck@chromium.org>
R:     Julius Werner <jwerner@chromium.org>
S:     Maintained
F:     drivers/firmware/google/

Is there a git tree somewhere that should be added?
What would be the
status of this proposed section?
Does someone really look after it at
all?
