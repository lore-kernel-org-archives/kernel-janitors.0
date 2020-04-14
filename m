From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Apr 2020 09:31:18 +0000
Subject: Re: [PATCH] usb: phy: jz4770: Add a missing '\n' in a log message
Message-Id: <20200414093118.GD1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200411063811.6767-1-christophe.jaillet@wanadoo.fr>
 <ZQKM8Q.561QQF8CXZTU3@crapouillou.net>
In-Reply-To: <ZQKM8Q.561QQF8CXZTU3@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Paul Cercueil <paul@crapouillou.net>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Apr 11, 2020 at 03:13:47PM +0200, Paul Cercueil wrote:
> Hi Christophe,
>=20
> Le sam. 11 avril 2020 =E0 8:38, Christophe JAILLET
> <christophe.jaillet@wanadoo.fr> a =E9crit :
> > Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
>=20
> Is that so?
>=20
> From what I could see these macros add the \n themselves if needed. So the
> \n were omitted on purpose.
>=20

Do a "make drivers/usb/phy/phy-jz4770.i" and look at the string.  The
patch is correct.

regards,
dan carpenter
