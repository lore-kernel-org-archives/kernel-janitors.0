From: Michael Krufky <mkrufky@linuxtv.org>
Date: Sun, 25 Mar 2007 21:54:03 +0000
Subject: Re: [KJ] [PATCH] dvb: remove coding style comments on indentation
Message-Id: <4606EF7B.4040307@linuxtv.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4606E766.3090100@linuxtv.org>
In-Reply-To: <4606E766.3090100@linuxtv.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Bernd Petrovitsch wrote:
> On Sun, 2007-03-25 at 17:19 -0400, Michael Krufky wrote:
>> Charles Cl=E9ment wrote:
>>> Remove comments on setting indentation for emacs in bt8xx driver.
>> What do we gain by this patch?  The "c-basic-offset: 8" helps us
>> to enforce tabbing style.  Why would anybody want this removed?
>=20
> I don't know.
>=20
> Adding "c-indent-tabs-mode: t" is probably even better.
>=20

Then, in my opinion, it would be better to submit a patch that makes that
change, instead of removing them altogether.

Regards,

Mike Krufky
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
