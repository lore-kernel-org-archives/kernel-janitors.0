From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Dec 2015 17:54:50 +0000
Subject: Re: Documentation-getdelays: Fix a check for container file usage in main()
Message-Id: <567C316A.6020406@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <567BE5AA.6070607@users.sourceforge.net>
 <567BE64C.4090604@users.sourceforge.net> <20151224072210.15d6ee6c@lwn.net>
In-Reply-To: <20151224072210.15d6ee6c@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>> The close() function could be called by the main() function even if
>> the passed variable "cfd" was assigned a negative value.
=85
> This seems more easily fixed by simply making the condition > 0.

How do you think about the reuse of the error predicate "cfd !=3D -1"
for the return value from a call of the function "open"?
http://pubs.opengroup.org/onlinepubs/9699919799/functions/open.html
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/Docum=
entation/accounting/getdelays.c?id=80c75a0f1d81922bf322c0634d1e1a15825a89e6=
#n425


> Meanwhile, I'd really not add labels-inside-if-statements as an example
> in the documentation tree.

How are the chances to improve the affected error detection
and corresponding exception handling?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
