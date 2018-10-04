From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 04 Oct 2018 10:49:27 +0000
Subject: Re: [PATCH -next] EDAC: Remove set but not used variable 'type'
Message-Id: <350b5c15-3b31-df3f-5abb-2e78bf0a49eb@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1537842964-109749-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1537842964-109749-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2018/9/26 1:15, Luck, Tony wrote:
> On Tue, Sep 25, 2018 at 12:11:07PM +0200, Borislav Petkov wrote:
>> On Tue, Sep 25, 2018 at 02:36:04AM +0000, YueHaibing wrote:
>>>  	if (uncorrected_error) {
>>> -		if (ripv) {
>>> -			type = "FATAL";
>>> +		if (ripv)
>>>  			tp_event = HW_EVENT_ERR_FATAL;
>>> -		} else {
>>> -			type = "NON_FATAL";
>>> +		else
>>>  			tp_event = HW_EVENT_ERR_UNCORRECTED;
>>> -		}
>>>  	} else {
>>> -		type = "CORRECTED";
>>>  		tp_event = HW_EVENT_ERR_CORRECTED;
>>>  	}
>>
>> Looks like this @type thing was never used. Tony, did you want to use it
>> for something?
> 
> That block of code looks to have been pasted from sb_edac.c, so likely
> need the same fix there.
> 
> It also looks to be wrong. Saying "FATAL" if mcgstatus.ripv is set
> looks wrong (and incomplete). If RIPV is *NOT* set, then this is fatal.
> But if it is set, then we should be looking at other bits (like PCC
> and AR) ... or maybe just calling mce_severity()?
> 
> Perhaps a moot point though. If the error is fatal, then we'll panic
> instead of calling the EDAC driver.

Thank you for comment

> 
> -Tony
> 
> .
> 
