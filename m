From: Colin Ian King <colin.king@canonical.com>
Date: Sat, 14 Nov 2020 22:09:55 +0000
Subject: Re: [PATCH][V2] PCI: Fix a potential uninitentional integer overflow issue
Message-Id: <69ad6ee1-60d5-61e1-8c07-fc81e9425722@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201114215329.GA1197070@bjorn-Precision-5520>
In-Reply-To: <20201114215329.GA1197070@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Stephen Bates <sbates@raithlin.com>, Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Logan Gunthorpe <logang@deltatee.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>

On 14/11/2020 21:53, Bjorn Helgaas wrote:
> [+cc Dan]
> 
> On Tue, Nov 10, 2020 at 10:10:48PM +0000, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The shift of 1 by align_order is evaluated using 32 bit arithmetic
>> and the result is assigned to a resource_size_t type variable that
>> is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
>> before widening issue by making the 1 a ULL.
>>
>> Addresses-Coverity: ("Unintentional integer overflow")
>> Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Applied to pci/misc for v5.11 with Logan's Reviewed-by and also the
> Fixes: correction.
> 
> I first applied the patch below to bounds-check the alignment as noted
> by Dan.
> 
>> ---
>>
>> V2: Use ULL instead of BIT_ULL(), fix spelling mistake and capitalize first
>>     word of patch subject.
>>
>> ---
>>  drivers/pci/pci.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>> index 3ef63a101fa1..248044a7ef8c 100644
>> --- a/drivers/pci/pci.c
>> +++ b/drivers/pci/pci.c
>> @@ -6214,7 +6214,7 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>>  			if (align_order = -1)
>>  				align = PAGE_SIZE;
>>  			else
>> -				align = 1 << align_order;
>> +				align = 1ULL << align_order;
>>  			break;
>>  		} else if (ret < 0) {
>>  			pr_err("PCI: Can't parse resource_alignment parameter: %s\n",
> 
> commit d6ca242c448f ("PCI: Bounds-check command-line resource alignment requests")
> Author: Bjorn Helgaas <bhelgaas@google.com>
> Date:   Thu Nov 5 14:51:36 2020 -0600
> 
>     PCI: Bounds-check command-line resource alignment requests
>     
>     32-bit BARs are limited to 2GB size (2^31).  By extension, I assume 64-bit
>     BARs are limited to 2^63 bytes.  Limit the alignment requested by the
>     "pci=resource_alignment=" command-line parameter to 2^63.
>     
>     Link: https://lore.kernel.org/r/20201007123045.GS4282@kadam
>     Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>     Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8b9bea8ba751..26c1b2d0bacd 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -6197,19 +6197,21 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>  	while (*p) {
>  		count = 0;
>  		if (sscanf(p, "%d%n", &align_order, &count) = 1 &&
> -							p[count] = '@') {
> +		    p[count] = '@') {
>  			p += count + 1;
> +			if (align_order > 63) {
> +				pr_err("PCI: Invalid requested alignment (order %d)\n",
> +				       align_order);
> +				align_order = PAGE_SHIFT;
> +			}
>  		} else {
> -			align_order = -1;
> +			align_order = PAGE_SHIFT;
>  		}
>  
>  		ret = pci_dev_str_match(dev, p, &p);
>  		if (ret = 1) {
>  			*resize = true;
> -			if (align_order = -1)
> -				align = PAGE_SIZE;
> -			else
> -				align = 1 << align_order;
> +			align = 1 << align_order;
>  			break;
>  		} else if (ret < 0) {
>  			pr_err("PCI: Can't parse resource_alignment parameter: %s\n",
> 

Thanks.
