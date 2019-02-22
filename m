From: maowenan <maowenan@huawei.com>
Date: Fri, 22 Feb 2019 03:17:52 +0000
Subject: Re: [PATCH] net: drop pointless static qualifier in atl2_probe()
Message-Id: <e325b40e-d822-797c-0865-b0f7e5b1561a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219143252.134824-1-maowenan@huawei.com>
In-Reply-To: <20190219143252.134824-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 2019/2/19 22:34, Dan Carpenter wrote:
> On Tue, Feb 19, 2019 at 10:32:52PM +0800, Mao Wenan wrote:
>> There is no need to have the 'T *v' variable static
>> since new value always be assigned before use it.
>>
>> Signed-off-by: Mao Wenan <maowenan@huawei.com>
>> ---
>>  drivers/net/ethernet/atheros/atlx/atl2.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
>> index bb41becb6609..6bd686b26837 100644
>> --- a/drivers/net/ethernet/atheros/atlx/atl2.c
>> +++ b/drivers/net/ethernet/atheros/atlx/atl2.c
>> @@ -1335,13 +1335,11 @@ static int atl2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>  {
>>  	struct net_device *netdev;
>>  	struct atl2_adapter *adapter;
>> -	static int cards_found;
>> +	int cards_found = 0;
>>  	unsigned long mmio_start;
>>  	int mmio_len;
>>  	int err;
>>  
>> -	cards_found = 0;
> 
> You're sending patches too quickly and you're not thinking about what
> you're doing.   If someone asks you to redo a patch, that should take
> over night to accomplish when you take time to think about what you're
> doing, but you have sent several versions of a patch in the same day.
> 
> This one is obviously wrong, but please take some time and slow down
> before resending.

I'm sorry for this, I have checked again, that the fixes will be as below:

diff --git a/drivers/net/ethernet/atheros/atlx/atl2.c b/drivers/net/ethernet/atheros/atlx/atl2.c
index bb41becb6609..31ff1e0d1baa 100644
--- a/drivers/net/ethernet/atheros/atlx/atl2.c
+++ b/drivers/net/ethernet/atheros/atlx/atl2.c
@@ -1335,13 +1335,11 @@ static int atl2_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
        struct net_device *netdev;
        struct atl2_adapter *adapter;
-       static int cards_found;
+       static int cards_found = 0;
        unsigned long mmio_start;
        int mmio_len;
        int err;

-       cards_found = 0;
-
        err = pci_enable_device(pdev);
        if (err)
                return err;


> 
> regards,
> dan carpenter
> 
> 
> 
> .
> 
