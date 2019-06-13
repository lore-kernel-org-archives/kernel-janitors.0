From: oulijun <oulijun@huawei.com>
Date: Thu, 13 Jun 2019 06:14:12 +0000
Subject: Re: [PATCH] RDMA/hns: Fix an error code in hns_roce_set_user_sq_size()
Message-Id: <e4a4e905-2c9e-151b-e995-4920687b09c0@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181217070815.GF12159@kadam>
In-Reply-To: <20181217070815.GF12159@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

=D4=DA 2019/6/13 1:23, Leon Romanovsky =D0=B4=B5=C0:
> On Sat, Jun 08, 2019 at 12:27:14PM +0300, Dan Carpenter wrote:
>> This function is supposed to return negative kernel error codes but here
>> it returns CMD_RST_PRC_EBUSY (2).  The error code eventually gets passed
>> to IS_ERR() and since it's not an error pointer it leads to an Oops in
>> hns_roce_v1_rsv_lp_qp()
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> Static analysis.  Not tested.
>>
>>  drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infini=
band/hw/hns/hns_roce_hw_v2.c
>> index ac017c24b200..018ff302ab9e 100644
>> --- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>> +++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
>> @@ -1098,7 +1098,7 @@ static int hns_roce_cmq_send(struct hns_roce_dev *=
hr_dev,
>>  	if (ret =3D CMD_RST_PRC_SUCCESS)
>>  		return 0;
>>  	if (ret =3D CMD_RST_PRC_EBUSY)
> The better fix will be to remove CMD_RST_PRC_* definitions in favor of
> normal errno.
>
> Thanks
>
> .
>
Sorry, Our guys are analyzing his influence. So the response is a bit late.
