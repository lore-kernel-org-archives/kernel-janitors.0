From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Jan 2018 14:55:37 +0000
Subject: Re: [PATCH] Intel-IOMMU: Delete an error message for a failed memory allocation in init_dmars()
Message-Id: <6b452dfb-b2fc-2417-26b3-bbcdf11ed06f@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <def26d40-37d3-d594-e17c-53e40a3034b7@users.sourceforge.net>
	<20180120133452.GB28161@8bytes.org>
In-Reply-To: <20180120133452.GB28161-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?B?SsO2cmcgUsO2ZGVs?= <joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org>, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

>> Date: Sat, 20 Jan 2018 13:51:49 +0100
>>
>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> NACK on this one and the other two IOMMU patches you sent.

Do you need any more background information for this general transformation pattern?


> The messages give the user/developer useful information about what the memory
> that failed to allocate would have been used for.

Do you find the Linux allocation failure report insufficient for this use case?

Regards,
Markus
