From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 10 Nov 2020 22:00:49 +0000
Subject: Re: [PATCH] PCI: fix a potential uninitentional integer overflow issue
Message-Id: <80bc99e9-1761-e849-5226-bb0ad63481a3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201110205436.GA692055@bjorn-Precision-5520>
In-Reply-To: <20201110205436.GA692055@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Stephen Bates <sbates@raithlin.com>, Logan Gunthorpe <logang@deltatee.com>, Alex Williamson <alex.williamson@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/11/2020 20:54, Bjorn Helgaas wrote:
> On Fri, Nov 06, 2020 at 11:04:19AM +0300, Dan Carpenter wrote:
>> On Thu, Nov 05, 2020 at 04:24:30PM -0600, Bjorn Helgaas wrote:
>>> On Wed, Oct 07, 2020 at 03:33:45PM +0300, Dan Carpenter wrote:
>>>> On Wed, Oct 07, 2020 at 12:46:15PM +0100, Colin King wrote:
>>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>>
>>>>> The shift of 1 by align_order is evaluated using 32 bit arithmetic
>>>>> and the result is assigned to a resource_size_t type variable that
>>>>> is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
>>>>> before widening issue by using the BIT_ULL macro to perform the
>>>>> shift.
>>>>>
>>>>> Addresses-Coverity: ("Uninitentional integer overflow")
>>>
>>> s/Uninitentional/Unintentional/
>>> Also in subject (please also capitalize subject)

OK

>>>
>>> Doesn't Coverity also assign an ID number for this specific issue?
>>> Can you include that as well, e.g.,

I'm running this from an internal coverity scan, so the ID is not public.

>>>
>>>   Addresses-Coverity-ID: 1226899 ("Unintentional integer overflow")
>>>
>>>>> Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")
>>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>>> ---
>>>>>  drivers/pci/pci.c | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
>>>>> index 6d4d5a2f923d..1a5844d7af35 100644
>>>>> --- a/drivers/pci/pci.c
>>>>> +++ b/drivers/pci/pci.c
>>>>> @@ -6209,7 +6209,7 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>>>>>  			if (align_order = -1)
>>>>>  				align = PAGE_SIZE;
>>>>>  			else
>>>>> -				align = 1 << align_order;
>>>>> +				align = BIT_ULL(align_order);
>>>>
>>>> "align_order" comes from sscanf() so Smatch thinks it's not trusted.
>>>> Anything above 63 is undefined behavior.  There should be a bounds check
>>>> on this but I don't know what the valid values of "align" are.
>>>
>>> The spec doesn't explicitly say what the size limit for 64-bit BARs
>>> is, but it does say 32-bit BARs can support up to 2GB (2^31).  So I
>>> infer that 2^63 would be the limit for 64-bit BARs.
>>>
>>> What about something like the following?  To me, BIT_ULL doesn't seem
>>> like an advantage over "1ULL << ", but maybe there's a reason to use
>>> it.
>>
>> The advantage of BIT_ULL() is that checkpatch and I think Coccinelle
>> will suggest using it.  It's only recently where a few people have
>> complained (actually you're probably the second person) that BIT() is
>> sort of a weird thing to use for size variables.
> 
> If that's the only reason, I definitely prefer "1ULL << align_order".
> 
> BIT_ULL is just a pointless abstraction in this case.
> 
OK. V2 Arriving later today

Colin
