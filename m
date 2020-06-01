From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Mon, 01 Jun 2020 13:45:52 +0000
Subject: Re: [PATCH -next] IB/hfi1: Remove set but not used variable 'priv'
Message-Id: <86634519-3dd8-0c6a-a8d2-19f4b986fd3d@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528075946.123480-1-yuehaibing@huawei.com>
 <MN2PR11MB396654BC46500F828609C6A3868E0@MN2PR11MB3966.namprd11.prod.outlook.com>
In-Reply-To: <MN2PR11MB396654BC46500F828609C6A3868E0@MN2PR11MB3966.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>, YueHaibing <yuehaibing@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Dan Carpenter (dan.carpenter@oracle.com)" <dan.carpenter@oracle.com>

On 5/28/2020 7:25 AM, Marciniszyn, Mike wrote:
>> From: YueHaibing <yuehaibing@huawei.com>
>> Sent: Thursday, May 28, 2020 4:00 AM
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>   drivers/infiniband/hw/hfi1/netdev_rx.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/infiniband/hw/hfi1/netdev_rx.c
>> b/drivers/infiniband/hw/hfi1/netdev_rx.c
>> index 58af6a454761..bd6546b52159 100644
>> --- a/drivers/infiniband/hw/hfi1/netdev_rx.c
>> +++ b/drivers/infiniband/hw/hfi1/netdev_rx.c
>> @@ -371,14 +371,9 @@ int hfi1_netdev_alloc(struct hfi1_devdata *dd)
>>
>>   void hfi1_netdev_free(struct hfi1_devdata *dd)
>>   {
>> -struct hfi1_netdev_priv *priv;
>> -
>> -if (dd->dummy_netdev) {
>> -priv = hfi1_netdev_priv(dd->dummy_netdev);
>> -dd_dev_info(dd, "hfi1 netdev freed\n");
>> -kfree(dd->dummy_netdev);
>> -dd->dummy_netdev = NULL;
>> -}
>> +dd_dev_info(dd, "hfi1 netdev freed\n");
>> +kfree(dd->dummy_netdev);
> 
> Dan Carpenter has reported kfree() should be free_netdev()...
> 
> Mike
> 

I'm OK with this patch going in and then adding a separate one to fix 
the kfree. Or this one can be touched up to include that as well.

-Denny
