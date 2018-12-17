From: oulijun <oulijun@huawei.com>
Date: Mon, 17 Dec 2018 11:18:35 +0000
Subject: Re: [PATCH] RDMA/hns: Fix an error code in hns_roce_create_srq()
Message-Id: <1cdd5eb9-c544-d972-89ba-e4c19c8e3180@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070815.GF12159@kadam>
In-Reply-To: <20181217070815.GF12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

=D4=DA 2018/12/17 15:08, Dan Carpenter =D0=B4=B5=C0:
> The function accidentally returns success on this error path.
>
> Fixes: c7bcb13442e1 ("RDMA/hns: Add SRQ support for hip08 kernel mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/hns/hns_roce_srq.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/infiniband/hw/hns/hns_roce_srq.c b/drivers/infiniban=
d/hw/hns/hns_roce_srq.c
> index 463df60094e8..6377e734e28e 100644
> --- a/drivers/infiniband/hw/hns/hns_roce_srq.c
> +++ b/drivers/infiniband/hw/hns/hns_roce_srq.c
> @@ -286,6 +286,7 @@ struct ib_srq *hns_roce_create_srq(struct ib_pd *pd,
>  		if (IS_ERR(srq->idx_que.umem)) {
>  			dev_err(hr_dev->dev,
>  				"ib_umem_get error for index queue\n");
> +			ret =3D PTR_ERR(srq->idx_que.umem);
>  			goto err_srq_mtt;
>  		}
> =20

Ok=A3=ACthanks
