From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Jan 2021 07:13:54 +0000
Subject: Re: [PATCH] ALSA: fireface: fix info leak in hwdep_read()
Message-Id: <20210122071354.GI20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAka5xudQNQgRkuC@mwanda>
 <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
In-Reply-To: <3ef5f7f4-efeb-8a92-1886-d92e14211287@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>, Clemens Ladisch <clemens@ladisch.de>, Takashi Iwai <tiwai@suse.com>

On Thu, Jan 21, 2021 at 09:42:04PM +0100, Christophe JAILLET wrote:
> Hi Dan,
>=20
> Le 21/01/2021 =E0 07:10, Dan Carpenter a =E9crit=A0:
> > If "ff->dev_lock_changed" has not changed
>=20
> According to the "while (!ff->dev_lock_changed) { ... }" just above and t=
he
> lock in place, can this ever happen?
>=20
> In other word, I wonder if the "if (ff->dev_lock_changed)" test makes sen=
se
> and if it could be removed.
>=20
>=20
> (same for your other patch against sound/firewire/oxfw/oxfw-hwdep.c)
>=20

Yeah.  That's a good point.  I'll resend.

regards,
dan carpenter
