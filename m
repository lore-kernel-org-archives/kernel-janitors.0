From: Mimi Zohar <zohar@linux.ibm.com>
Date: Wed, 23 Jan 2019 18:38:55 +0000
Subject: Re: [PATCH -next] evm: remove set but not used variable 'xattr'
Message-Id: <1548268735.3971.6.camel@linux.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1544867636-59276-1-git-send-email-yuehaibing@huawei.com>
         <1544868370-83459-1-git-send-email-yuehaibing@huawei.com>
         <9bdb64b6-501e-cd37-d4ab-a041ac25e738@huawei.com>
In-Reply-To: <9bdb64b6-501e-cd37-d4ab-a041ac25e738@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: YueHaibing <yuehaibing@huawei.com>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-integrity@vger.kernel.org, linux-security-module@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2019-01-17 at 16:21 +0800, YueHaibing wrote:
> ping...
>=20
> On 2018/12/15 18:06, YueHaibing wrote:
> > Fixes gcc '-Wunused-but-set-variable' warning:
> >=20
> > security/integrity/evm/evm_main.c: In function 'init_evm':
> > security/integrity/evm/evm_main.c:566:21: warning:
> >  variable 'xattr' set but not used [-Wunused-but-set-variable]
> >=20
> > It never used since commit 21af76631476 ("EVM: turn evm_config_xattrnam=
es
> > into a list")
> >=20
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Thank you. =C2=A0This patch is now queued in the next-integrity branch of
https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git

Mimi

> > ---
> >  security/integrity/evm/evm_main.c | 6 +-----
> >  1 file changed, 1 insertion(+), 5 deletions(-)
> >=20
> > diff --git a/security/integrity/evm/evm_main.c b/security/integrity/evm=
/evm_main.c
> > index 5ecaa3d..b6d9f14 100644
> > --- a/security/integrity/evm/evm_main.c
> > +++ b/security/integrity/evm/evm_main.c
> > @@ -563,7 +563,6 @@ static int __init init_evm(void)
> >  {
> >  	int error;
> >  	struct list_head *pos, *q;
> > -	struct xattr_list *xattr;
> > =20
> >  	evm_init_config();
> > =20
> > @@ -580,11 +579,8 @@ static int __init init_evm(void)
> >  error:
> >  	if (error !=3D 0) {
> >  		if (!list_empty(&evm_config_xattrnames)) {
> > -			list_for_each_safe(pos, q, &evm_config_xattrnames) {
> > -				xattr =3D list_entry(pos, struct xattr_list,
> > -						   list);
> > +			list_for_each_safe(pos, q, &evm_config_xattrnames)
> >  				list_del(pos);
> > -			}
> >  		}
> >  	}
> >=20
> >=20
> >=20
> >=20
> > .
> >=20
>=20
