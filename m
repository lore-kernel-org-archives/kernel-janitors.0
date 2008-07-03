From: Zhu Yi <yi.zhu@intel.com>
Date: Thu, 03 Jul 2008 01:51:52 +0000
Subject: Re: [PATCH]  drivers/net/wireless/iwlwifi/iwl-3945.c
Message-Id: <1215049912.14590.525.camel@debian.sh.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1214962647.18261.15.camel@localhost.localdomain>
	 <20080702192457.GB31288@tuxdriver.com>
In-Reply-To: <20080702192457.GB31288@tuxdriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: "John W. Linville" <linville@tuxdriver.com>
Cc: Darren Jenkins <darrenrjenkins@gmail.com>, kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, ipw2100-admin@linux.intel.com, reinette.chatre@intel.com

On Wed, 2008-07-02 at 15:24 -0400, John W. Linville wrote:
> What about the format line in the IWL_DEBUG_RX that uses rate?
>=20
> Also, please use an email subject that is more descriptive than just
> the filename.  You should probably drop the "G'day..." line as well.

Side with John.

> On Wed, Jul 02, 2008 at 11:37:27AM +1000, Darren Jenkins" wrote:
> > G'day people
> >=20
> > Coverity CID: 2265 NEGATIVE_RETURNS
> >=20
> > "rate" is of an unsigned type, and the code requires a signed type.
> > The following patch makes it so.
> >=20
> > Only compile tested.
> >=20
> > =EF=BB=BFSigned-off-by: Darren Jenkins <darrenrjenkins@gmailcom>
> >=20
> > diff --git a/drivers/net/wireless/iwlwifi/iwl-3945.c b/drivers/net/wire=
less/iwlwifi/iwl-3945.c
> > index 62a3d8f..31d38cd 100644
> > --- a/drivers/net/wireless/iwlwifi/iwl-3945.c
> > +++ b/drivers/net/wireless/iwlwifi/iwl-3945.c
> > @@ -449,7 +449,7 @@ static void iwl3945_dbg_report_frame(struct iwl3945=
_priv *priv,
> > =20
> >  	if (print_summary) {
> >  		char *title;
> > -		u32 rate;
> > +		int rate;
> > =20
> >  		if (hundred)
> >  			title =3D "100Frames";

The rate variable here takes two roles: one for calculate the index
(singed) and the other for the actual rate (unsigned). I think if you do
want to fix this, create another local variable int idx to hold the
index result.

Thanks,
-yi

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
