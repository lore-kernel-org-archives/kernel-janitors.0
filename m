From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 14 Jun 2020 18:18:27 +0000
Subject: Re: [PATCH] RDMA/rvt: Improve exception handling in rvt_create_qp()
Message-Id: <308f471c-8294-157f-3e3d-4a7f6473381e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5d99dfe5-67ed-00d2-c2da-77058fb770c6@web.de>
In-Reply-To: <5d99dfe5-67ed-00d2-c2da-77058fb770c6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Aditya Pakki <pakki001@umn.edu>, Dennis Dalessandro <dennis.dalessandro@intel.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Kangjie Lu <kjlu@umn.edu>, Mike Marciniszyn <mike.marciniszyn@intel.com>, Qiushi Wu <wu000273@umn.edu>

> …
>> +++ b/drivers/infiniband/sw/rdmavt/qp.c
>> @@ -1203,6 +1203,7 @@  struct ib_qp *rvt_create_qp(struct ib_pd *ibpd,
>>  			qp->s_flags = RVT_S_SIGNAL_REQ_WR;
>>  		err = alloc_ud_wq_attr(qp, rdi->dparms.node);
>>  		if (err) {
>> +			rvt_free_rq(&qp->r_rq);
>>  			ret = (ERR_PTR(err));
>>  			goto bail_driver_priv;
>>  		}
>
> How do you think about the following code variant with the addition
> of a jump target?
>
>  		err = alloc_ud_wq_attr(qp, rdi->dparms.node);
>  		if (err) {
>  			ret = (ERR_PTR(err));
> -			goto bail_driver_priv;
> +			goto bail_free_rq;
>  		}
>
> …
>
>  bail_rq_wq:
> -	rvt_free_rq(&qp->r_rq);
>  	free_ud_wq_attr(qp);
> +
> +bail_free_rq:
> +	rvt_free_rq(&qp->r_rq);
>
>  bail_driver_priv:

The improvement of affected implementation details is continued with
another update suggestion.

RDMA/rvt: Fix potential memory leak caused by rvt_alloc_rq
https://lore.kernel.org/linux-rdma/20200614041148.131983-1-pakki001@umn.edu/
https://lore.kernel.org/patchwork/patch/1255709/

Regards,
Markus
