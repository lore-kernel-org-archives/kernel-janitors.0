From: Joe Perches <joe@perches.com>
Date: Tue, 15 Dec 2015 14:27:56 +0000
Subject: Re: [PATCH 1/7] staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <1450189676.3551.1.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <566D7733.1030102@users.sourceforge.net>
	 <566D7830.9060000@users.sourceforge.net>
In-Reply-To: <566D7830.9060000@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: SF Markus Elfring <elfring@users.sourceforge.net>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Sun, 2015-12-13 at 14:52 +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 13 Dec 2015 09:30:47 +0100
>=20
> Six goto statements referred to a source code position directly behind th=
em.
> Thus omit such unnecessary jumps.

I suggest you leave a blank line instead
of deleting the goto.

> diff --git a/drivers/staging/lustre/lustre/llite/namei.c b/drivers/stagin=
g/lustre/lustre/llite/namei.c
[]
> @@ -554,7 +554,6 @@ static struct dentry *ll_lookup_it(struct inode *pare=
nt, struct dentry *dentry,
> =A0		retval =3D NULL;
> =A0	else
> =A0		retval =3D dentry;
> -	goto out;
> =A0 out:
> =A0	if (req)
> =A0		ptlrpc_req_finished(req);

etc.,,
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
