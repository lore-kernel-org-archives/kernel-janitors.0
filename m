From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Jan 2018 10:55:16 +0000
Subject: Re: [PATCH] misc/lis3lv02d: Delete an error message for a failed memory allocation in lis3lv02d_init
Message-Id: <20180109105516.qtnwvbsfhvuvyvkp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c71380d4-50f4-3d8f-8c7f-4df5a0098402@users.sourceforge.net>
 <6f1bcb25-b2bd-da30-5e9c-60340ceffed7@tremplin-utc.net>
In-Reply-To: <6f1bcb25-b2bd-da30-5e9c-60340ceffed7@tremplin-utc.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?=C9ric?= Piel <eric.piel@tremplin-utc.net>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>

On Tue, Jan 09, 2018 at 09:11:51AM +0100, =C9ric Piel wrote:
> On 08/01/18 22:33, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Mon, 8 Jan 2018 22:26:06 +0100
> >=20
> > Omit an extra message for a memory allocation failure in this function.
> >=20
> > This issue was detected by using the Coccinelle software.
> >=20
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> Thanks, looks fine.
>=20
> Signed-off-by: =C9ric Piel <eric.piel@tremplin-utc.net>
>=20
> Maybe the "Kernel Janitors" can just pick it up?
>=20

Kernel Janitors basically just reviews patches.  (Although I don't
review Markus's patches any more).

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
