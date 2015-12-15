From: Joe Perches <joe@perches.com>
Date: Tue, 15 Dec 2015 18:10:11 +0000
Subject: Re: [PATCH 1/7] staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <1450203011.4142.4.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <566D7733.1030102@users.sourceforge.net>
	 <566D7830.9060000@users.sourceforge.net>
	 <1450189676.3551.1.camel@perches.com> <20151215144133.GC5284@mwanda>
	 <1450191751.3551.14.camel@perches.com> <20151215174844.GE5284@mwanda>
In-Reply-To: <20151215174844.GE5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 2015-12-15 at 20:48 +0300, Dan Carpenter wrote:
> On Tue, Dec 15, 2015 at 07:02:31AM -0800, Joe Perches wrote:
> > This is the original code:
> >=20
> > 	result =3D foo();
> > 	if (result)
> > 		goto label;
> >=20
> > 	result =3D bar();
> > 	if (result)
> > 		goto label;
> >=20
> > 	result =3D baz();
> > 	if (result)
> > 		goto label;
> >=20
> > label:
> > 	go on...
> >=20
>=20
> No.=A0=A0There is no test.=A0=A0The original code looks like:
>=20
> 	result =3D foo();
> 	if (result)
> 		goto out;
> 	result =3D baz();
> 	goto out;
> out:
> 	go on..
>=20
> regards,
> dan carpenter

Here is the original code:
---------------------
	/* Copy hsm_progress struct */
	req_hpk =3D req_capsule_client_get(&req->rq_pill, &RMF_MDS_HSM_PROGRESS);
	if (req_hpk =3D NULL) {
		rc =3D -EPROTO;
		goto out;
	}

	*req_hpk =3D *hpk;
	req_hpk->hpk_errval =3D lustre_errno_hton(hpk->hpk_errval);

	ptlrpc_request_set_replen(req);

	rc =3D mdc_queue_wait(req);
	goto out;
out:
	ptlrpc_req_finished(req);
	return rc;
}
---------------------

I think if the last goto out; is to be removed,
then it should be replaced by a blank line.

It separates the last operation block from the return.

cheers, Joe
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
