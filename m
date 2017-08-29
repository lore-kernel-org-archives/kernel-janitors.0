From: Kishon Vijay Abraham I <kishon@ti.com>
Date: Tue, 29 Aug 2017 06:41:44 +0000
Subject: Re: [PATCH][pci-next] PCI: endpoint: fix incorrect end of table check in while loop
Message-Id: <979c168c-2334-d509-29b6-891799fc5f61@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170823160303.23366-1-colin.king@canonical.com>
 <20170828182505.GH8154@bhelgaas-glaptop.roam.corp.google.com>
In-Reply-To: <20170828182505.GH8154@bhelgaas-glaptop.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>, Colin King <colin.king@canonical.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Monday 28 August 2017 11:55 PM, Bjorn Helgaas wrote:
> On Wed, Aug 23, 2017 at 05:03:03PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently, the while loop will iterate until a matching name is found
>> or until the id pointer wraps around to NULL (the latter is incorrect).
>>
>> The end of a pci_epf_device_id table is terminated with zero'd entries
>> for name and driver_data, so can change the while loop to iterate while
>> the first character in the name is a non-zero character.
>>
>> Detected by CoverityScan, CID#1454557 ("Logically dead code")
>>
>> Fixes: 9e9d6eb48623 ("PCI: endpoint: Add an API to get matching "pci_epf_device_id")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> Kishon, do you want to ack this, please?

Acked-by: Kishon Vijay Abraham I <kishon@ti.com>
> 
>> ---
>>  drivers/pci/endpoint/pci-epf-core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/pci/endpoint/pci-epf-core.c b/drivers/pci/endpoint/pci-epf-core.c
>> index ae6fac5995e3..70eccc04ee7f 100644
>> --- a/drivers/pci/endpoint/pci-epf-core.c
>> +++ b/drivers/pci/endpoint/pci-epf-core.c
>> @@ -273,7 +273,7 @@ pci_epf_match_device(const struct pci_epf_device_id *id, struct pci_epf *epf)
>>  	if (!id || !epf)
>>  		return NULL;
>>  
>> -	while (id) {
>> +	while (*id->name) {
>>  		if (strcmp(epf->name, id->name) = 0)
>>  			return id;
>>  		id++;
>> -- 
>> 2.14.1
>>
