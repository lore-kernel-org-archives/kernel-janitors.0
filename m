From: Markus Elfring <Markus.Elfring@web.de>
Date: Thu, 09 Jan 2020 13:42:41 +0000
Subject: Re: [PATCH] selinuxfs: use scnprintf to get real length in sel_read_class
Message-Id: <0f920e15-2462-2a0b-ced2-40ee60132839@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ba3290e18f9867e110b77d058c3f8c7015bd868b.1578274288.git.liuyang34@xiaomi.com>
In-Reply-To: <ba3290e18f9867e110b77d058c3f8c7015bd868b.1578274288.git.liuyang34@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: yangliuxm34@gmail.com, selinux@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, liuyang34@xiaomi.com, Eric Paris <eparis@parisplace.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <sds@tycho.nsa.gov>

> as the return value of snprintf maybe over the size of TMPBUFLEN,
> use scnprintf to instead of it

Please improve your commit message.


> Signed-off-by: liuyang34 =E2=80=A6

Will this information need also an adjustment for the desired specification
of a real name?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/process/submitting-patches.rst?id=3Db07f636fca1c8fbba124b0082487=
c0b3890a0e0c#n458

Regards,
Markus
