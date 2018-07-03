From: "Hook, Gary" <ghook@amd.com>
Date: Tue, 03 Jul 2018 16:27:25 +0000
Subject: Re: [PATCH] iommu/amd: fix missing tag from dev_err message
Message-Id: <dc5d5fc0-0c4b-3728-2dba-987840e7c1fc@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180703064005.18908-1-colin.king@canonical.com>
	<6763ec382f8d629f5f356f4cc023f20c2f76b26a.camel@perches.com>
	<d27fe634-89cf-7d9a-3e3d-a2baafabf0be@amd.com>
	<d93bfa0f52d8907019b16336645986cd339ebf75.camel@perches.com>
	<f3e15437-68c1-58eb-bc34-93fa70e50dc9@amd.com>
	<6fbcf273-bc0a-5dbd-fa0e-a7f656c4ccbc@canonical.com>
In-Reply-To: <6fbcf273-bc0a-5dbd-fa0e-a7f656c4ccbc-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Joerg Roedel <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/3/2018 11:24 AM, Colin Ian King wrote:
> On 03/07/18 17:21, Hook, Gary wrote:
>> On 7/3/2018 10:55 AM, Joe Perches wrote:
>>> On Tue, 2018-07-03 at 07:56 -0500, Gary R Hook wrote:
>>>> On 07/03/2018 05:07 AM, Joe Perches wrote:
>>>>> On Tue, 2018-07-03 at 07:40 +0100, Colin King wrote:
>>>>>> Currently tag is being assigned but not used, it is missing from
>>>>>> the dev_err message, so add it in.
>>>>>>
>>>>>> Cleans up clang warning:
>>>>>> warning: variable 'tag' set but not used [-Wunused-but-set-variable]
>>>>>
>>>>> []
>>>>>> diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
>>>>>
>>>>> []
>>>>>> @@ -616,9 +616,9 @@ static void iommu_print_event(struct amd_iommu
>>>>>> *iommu, void *__evt)
>>>>>>             pasid = ((event[0] >> 16) & 0xFFFF)
>>>>>>                 | ((event[1] << 6) & 0xF0000);
>>>>>>             tag = event[1] & 0x03FF;
>>>>>> -        dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x
>>>>>> pasid=0x%05x address=0x%016llx flags=0x%04x]\n",
>>>>>> +        dev_err(dev, "INVALID_PPR_REQUEST device=%02x:%02x.%x
>>>>>> pasid=0x%05x address=0x%016llx flags=0x%04x tag=0x%03x]\n",
>>>>>>                 PCI_BUS_NUM(devid), PCI_SLOT(devid), PCI_FUNC(devid),
>>>>>> -            pasid, address, flags);
>>>>>> +            pasid, address, flags, tag);
>>>>>
>>>>> Seems to have a superfluous ] that should be removed.
>>>>
>>>> Yeah, I pretty much messed up all of the log messages in that function.
>>>> My apologies. I'll create a patch for that problem; it shouldn't be
>>>> fixed here.
>>
>> Well, no, I misremembered. The extraneous square brace has been there
>> forever. Needs fixin', though.
>>
> 
> The opening square bracket is much earlier:
> 
> dev_err(dev, "AMD-Vi: Event logged [");
> 
> ..and all the subsequent dev_err messages have the trailing square bracket.

Gah! Mystery solved. I'd forgotten about that.

"Never mind."


