From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 19 Nov 2013 08:24:10 +0000
Subject: Re: [patch] mfd: ab8500-debugfs: move dereference after check for NULL
Message-Id: <20131119082410.GV13640@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074030.GA25541@elgon.mountain>
 <CACRpkdZ3GbUCkK3mte3wM_WCmtuvOvCYfu2PkJSy+7yhx_qpqQ@mail.gmail.com>
In-Reply-To: <CACRpkdZ3GbUCkK3mte3wM_WCmtuvOvCYfu2PkJSy+7yhx_qpqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Tue, 19 Nov 2013, Linus Walleij wrote:

> On Wed, Nov 13, 2013 at 8:40 AM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
>=20
> > We dereference "desc" before check if it is NULL.  I've shifted it
> > around so we check first before dereferencing.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > I am not able to compile this.
>=20
> Looks and compiles good.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>=20
> Lee are you queueing this?

This one slipped through the net, thanks for bringing it to my attention.

Applied, thanks.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
