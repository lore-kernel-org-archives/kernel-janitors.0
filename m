From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Tue, 14 Mar 2017 11:34:31 +0000
Subject: Re: [PATCH][V2] scsi: cxgb3i: remove redundant null check and kfree on skb
Message-Id: <20170314113431.GC4015@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170314104843.1358-1-colin.king@canonical.com>
In-Reply-To: <20170314104843.1358-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Karen Xie <kxie@chelsio.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 14, 2017 at 10:48:43AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>=20
> On the error exit path, skb is always null, so the non-null check
> and __kfree_skb call are redundant.  Remove the redundant code and
> just directly return with the appropriate error return code.
>=20
> Detected by CoverityScan, CID#114328 ("Logically Dead Code")
>=20
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/scsi/cxgbi/cxgb3i/cxgb3i.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c b/drivers/scsi/cxgbi/cxgb=
3i/cxgb3i.c
> index 1880eb6..3c9f8cf2 100644
> --- a/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
> +++ b/drivers/scsi/cxgbi/cxgb3i/cxgb3i.c
> @@ -979,14 +979,14 @@ static int init_act_open(struct cxgbi_sock *csk)
>  	csk->atid =3D cxgb3_alloc_atid(t3dev, &t3_client, csk);
>  	if (csk->atid < 0) {
>  		pr_err("NO atid available.\n");
> -		goto rel_resource;
> +		return -EINVAL;
>  	}
>  	cxgbi_sock_set_flag(csk, CTPF_HAS_ATID);
>  	cxgbi_sock_get(csk);
> =20
>  	skb =3D alloc_wr(sizeof(struct cpl_act_open_req), 0, GFP_KERNEL);
>  	if (!skb)
> -		goto rel_resource;
> +		return -ENOMEM;

I don't think that's correct, not that it was before. cxgbi_sock_get(csk) d=
oes a
kref_get(&csk->refcnt), so this will at lease leak a kref. It will also "le=
ak"
the atids_in_use in cxgb3_alloc_atid() as there's a call to cxgb3_free_atid=
()
missing. Looks like the complete cleanup path is worng here.

But I'd prefer having Karen or someone else at Chelsio confirm my assumptio=
ns.

Thanks,
	Johannes

--=20
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
