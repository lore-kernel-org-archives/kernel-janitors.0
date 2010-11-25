From: david chosrova <dada2372@gmail.com>
Date: Thu, 25 Nov 2010 09:39:48 +0000
Subject: Re: [PATCH] Fix sparse message rtl8192u
Message-Id: <4CEE2EE4.1010300@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
In-Reply-To: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello,

Ok I'll check this out and send back the patch.

Thanks for the feedback.

Regards.

David Chosrova

Le 25/11/2010 06:36, Dan Carpenter a =E9crit :
> On Wed, Nov 24, 2010 at 10:41:43PM +0100, david.chosrova@libertysurf.fr w=
rote:
>>
>>
>> Hello,
>>
>> Fix sparse message:
>>
>> drivers/staging/rtl8192u/r8192U_core.c:247:1: warning: "eqMacAddr" redef=
ined
>> In file included from drivers/staging/rtl8192u/:81:81:
>> drivers/staging/rtl8192u/dot11d.h:35:1: warning: this is the location of=
 the
>> previous definition
>>
>> if ENABLE_DOT11D is enabled eqMacAddr is defined twice.
>>
>=20
> It would be better to remove the #ifdef around the include "dot11d.h"
> and delete this definition.
>=20
> Also your email client is line wrapping on long lines and changing=20
> tabs to spaces.  Read Documentation/email-clients.txt then send an=20
> email to yourself.  Save the raw email (including email headers=20
> and everything) then `cat email.txt | patch -p1`  Resend when the
> patch applies.
>=20
> CC the maintainers when you resend:
> 	Greg Kroah-Hartman <gregkh@suse.de>,
> 	devel@driverdev.osuosl.org
>=20
> regards,
> dan carpenter
>=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
