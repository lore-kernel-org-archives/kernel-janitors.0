From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 12 Aug 2019 10:00:45 +0000
Subject: Re: floppy: fix usercopy direction
Message-Id: <e514a05f-6e9f-1d62-9b38-163e13578bff@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ee24295-6d63-6da9-774f-f1a599418685@linux.com>
In-Reply-To: <3ee24295-6d63-6da9-774f-f1a599418685@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Alexander Popov <alex.popov@linux.com>, Jann Horn <jannh@google.com>, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, cocci@systeme.lip6.fr
Cc: Jens Axboe <axboe@kernel.dk>, Jiri Kosina <jikos@kernel.org>, Mukesh Ojha <mojha@codeaurora.org>, kernel-hardening@lists.openwall.com, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>, linux-block@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Al Viro <viro@zeniv.linux.org.uk>

> =E2=80=A6, I see `exists` allows to drop `<+ +>`, right?

I would interpret the combination of such SmPL specifications in a differen=
t way.


> It turned out that sparse already can find these bugs.

This is generally nice, isn't it?


> Is this rule useful anyway?

I hope so.

Can scripts for the semantic patch language help any more?


> If so, I can prepare a patch.

Would you like to take corresponding adjustments into account?

Regards,
Markus
