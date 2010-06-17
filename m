From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Thu, 17 Jun 2010 17:46:25 +0000
Subject: Re: [PATCH] staging/wlags49_h2: Fix build error when CONFIG_SYSFS is
Message-Id: <AANLkTimDyM2vDlHknRqNds63Vn2RX3Woiy814zBQr-5e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1276751864.14632.6.camel@lenovo>
In-Reply-To: <1276751864.14632.6.camel@lenovo>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hank,

Thank you very much for your feedback.

On Thu, Jun 17, 2010 at 1:23 PM, Henk de Groot <henk.de.groot@hetnet.nl> wr=
ote:
> The only problem I see is a
> possible complained from the compiler because of an argument that's defin=
ed
> but never used. The only way around that is to avoid the call to the
> function in the first place by using compiler directives in the code (or =
use
> a #define but that solution was already rejected). Disabling the call to =
the
> function in the code may even save some more overhead and make the memory
> footprint smaller.

I thought about using #ifdefs in the code too but then read in
Documentation/SubmittingPatches:

2) #ifdefs are ugly

Code cluttered with ifdefs is difficult to read and maintain.  Don't do
it. Instead, put your ifdefs in a header, and conditionally define
'static inline'

So I discard this option. Do you want me to do it anyway and send a
new patch? I'm willing to solve it the right way.

Thanks a lot.

Best regards,

-----------------------------------------
Javier Mart=C3=ADnez Canillas
+595 981 88 66 58
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
