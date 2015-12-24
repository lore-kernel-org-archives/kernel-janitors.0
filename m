From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 19:40:32 +0000
Subject: Re: Documentation-getdelays: Less function calls in usage()
Message-Id: <567C4A30.8040500@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567BE5AA.6070607@users.sourceforge.net>
 <567BE729.7030800@users.sourceforge.net> <20151224072332.6df702b3@lwn.net>
In-Reply-To: <20151224072332.6df702b3@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> A single call of the fprintf() function is sufficient for the desired
>> display of the usage information.
>=20
> This seems like churn that doesn't actually fix anything.

Will it matter occasionally to reduce the number of function calls
by combining several text fragments into the passing of one longer
string parameter?

Does a warning like "quoted string split across lines" need also
any further considerations for the Linux coding style specification?
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/scrip=
ts/checkpatch.pl?id=80c75a0f1d81922bf322c0634d1e1a15825a89e6#n4837

Regards,
Markus

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
