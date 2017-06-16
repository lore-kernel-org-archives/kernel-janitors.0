From: Joe Perches <joe@perches.com>
Date: Fri, 16 Jun 2017 22:44:37 +0000
Subject: endian bitshift defects [ was: staging: fusb302: don't bitshift __le16 type ]
Message-Id: <1497653077.10546.23.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170616174556.2358-1-fransklaver@gmail.com>
In-Reply-To: <20170616174556.2358-1-fransklaver@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Frans Klaver <fransklaver@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors <kernel-janitors@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Yueyao Zhu <yueyao.zhu@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, Guru Das Srinagesh <gurooodas@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Fri, 2017-06-16 at 19:45 +0200, Frans Klaver wrote:
> The header field in struct pd_message is declared as an __le16 type. The
> data in the message is supposed to be little endian. This means we don't
> have to go and shift the individual bytes into position when we're
> filling the buffer, we can just copy the contents right away. As an
> added benefit we don't get fishy results on big endian systems anymore.

Thanks for pointing this out.

There are several instances of this class of error.

Here's a cocci script to find them.

This is best used with cocci's --all-includes option like:

$ spatch --all-includes --very-quiet --sp-file lebe_bitshifts.cocci .
[ many defects...]

$ cat lebe_bitshifts.cocci
@@
typedef __le16, __le32, __le64,=A0=A0__be16, __be32, __be64;
{ __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
expression b;
@@

*	a << b

@@
{ __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
expression b;
@@

*	a <<=3D b

@@
{ __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
expression b;
@@

*	a >> b

@@
{ __le16, __le32, __le64,=A0=A0__be16, __be32, __be64 } a;
expression b;
@@

*	a >>=3D b
$

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
