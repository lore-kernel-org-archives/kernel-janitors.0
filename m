From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 13 Feb 2017 11:12:51 +0000
Subject: Re: IB/hfi1: Use memdup_user() rather than duplicating its implementation in hfi1_user_sdma_process_
Message-Id: <4094dc04-bb2c-a74e-8d4d-8879ac4e7761@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8a997282-09c7-0f9f-645e-d7c6e8c79e67@users.sourceforge.net>
 <b19e44b3-601f-c642-b8d3-12c000511ce2@users.sourceforge.net>
 <477c8499-93ad-253d-aa2b-8f209ecfad62@intel.com>
 <20170213105350.GA4108@mwanda>
In-Reply-To: <20170213105350.GA4108@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dennis Dalessandro <dennis.dalessandro-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Marciniszyn <mike.marciniszyn-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

>> Thanks for the patch, but this one is already taken care of along
>> with other similar uses of kmalloc/copy:
>>
>> http://marc.info/?l=3Dlinux-rdma&m=148656088729538&w=3D2
>>
>=20
> Michael's patch doesn't change user_sdma_free_request() so it introduces
> a kfreeing an error pointer bug.

Did you notice that another local variable =93tmp=94 was introduced in the =
update step
=93[PATCH 27/27] IB/hfi1: Code reuse with memdup_copy=94 so that
the mentioned function will usually get a null pointer after a failure ther=
e?

Regards,
Markus
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
