From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sat, 24 Sep 2016 12:06:07 +0000
Subject: Re: [PATCH 10/10] firewire-net: Adjust checks for null pointers in five functions
Message-Id: <20160924140607.41b782fa@kant>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
        <cb0935d1-4a50-5a1c-a4f2-23937560abf5@users.sourceforge.net>
        <99ff298b-0caa-9f47-d7db-57b6fbd69360@users.sourceforge.net>
In-Reply-To: <99ff298b-0caa-9f47-d7db-57b6fbd69360@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux1394-devel@lists.sourceforge.net, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sep 18 SF Markus Elfring wrote:
> The script "checkpatch.pl" can point information out like the following.

A side note:  checkpatch.pl is for authors to help prepare their
submissions of new code (or their refactoring of existing code if for some
reason a refactoring is undertaken).

> Comparison to NULL could be written !=E2=80=A6

Yes it could, or it could remain as is.  Both styles are used in
drivers/firewire/net.c, so it is indeed preferable to normalize it to one
of them.  I keep your patch for the next occasion when related work is
being done on drivers/firewire/net.c or drivers/firewire.

> Thus fix the affected source code places.

It is not a "fix", it is a stylistic change.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/firewire/net.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/firewire/net.c b/drivers/firewire/net.c
> index eb7ce5e..e313be3 100644
> --- a/drivers/firewire/net.c
> +++ b/drivers/firewire/net.c
> @@ -366,13 +366,13 @@ static struct fwnet_partial_datagram *fwnet_pd_new(=
struct net_device *net,
> =20
>  	INIT_LIST_HEAD(&new->fi_list);
>  	fi =3D fwnet_frag_new(new, frag_off, frag_len);
> -	if (fi =3D NULL)
> +	if (!fi)
>  		goto free_new;
[...]
--=20
Stefan Richter
-=3D=3D=3D----- =3D--=3D =3D---
http://arcgraph.de/sr/
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
