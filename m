From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 09 Aug 2013 02:36:52 +0000
Subject: Re: [PATCH] net:ethernet:korina.c Removed IRQF_DISABLED
Message-Id: <520452F4.2070804@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375989649-7252-1-git-send-email-kumargauravgupta3@gmail.com>  <20130808210918.GE5502@mwanda>  <20130808.142054.1541424422807503741.davem@davemloft.net> <1375997625.2087.14.camel@joe-AO722>
In-Reply-To: <1375997625.2087.14.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com, emilio@elopez.com.ar, mugunthanvnm@ti.com, jg1.han@samsung.com, hsweeten@visionengravers.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Friday 09 August 2013 03:03 AM, Joe Perches wrote:
> On Thu, 2013-08-08 at 14:20 -0700, David Miller wrote:
>> From: Dan Carpenter <dan.carpenter@oracle.com>
>> Date: Fri, 9 Aug 2013 00:09:18 +0300
>>
>>> On Fri, Aug 09, 2013 at 12:50:49AM +0530, Kumar Gaurav wrote:
>>>> Removed IRQF_DISABLED as it's no-op and should be removed
>>>>
>>> What?  No, that doesn't sound right.
>> The IRQ layer completely ignores the flag for several releases
>> now, it's a complete no-op as his commit message so adequately
>> states.
>>
>> So what's the problem again? :-)
I'm quite new to kernel development. I saw in one of the patches which 
fixes IRQF_DISABLED issue by removing so i did.
> Wouldn't it be better to do a sed 's/IRQF_DISABLED/0/' instead?
> Maybe Kumar wants to/is doing that?
Yes i wanted to do the same and i retrieved list of all programs 
containing IRQF_DISABLED but i didn't wanted to send all of them in one 
patch. I would be sending them for one program in one patch.

Regards
Kumar Gaurav
