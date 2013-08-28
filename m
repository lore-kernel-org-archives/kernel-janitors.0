From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Wed, 28 Aug 2013 15:21:06 +0000
Subject: Re: [PATCH v3] xHCI: Fixing xhci_readl definition and function call
Message-Id: <521E1292.5060709@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1377482937-7486-1-git-send-email-kumargauravgupta3@gmail.com> <20130828071304.GO6329@mwanda>
In-Reply-To: <20130828071304.GO6329@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: sarah.a.sharp@linux.intel.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wednesday 28 August 2013 12:43 PM, Dan Carpenter wrote:
> On Mon, Aug 26, 2013 at 07:38:57AM +0530, Kumar Gaurav wrote:
>> This patch redefine function xhci_readl.xhci_readl function doesn't use xhci_hcd argument.
>> Hence there is no need of keeping it in the function arguments.
>>
>> Redefining this function breaks other functions which calls this function.
>> This phatch also correct those calls in xhci driver.
>>
>> Signed-off-by: Kumar Gaurav <kumargauravgupta3@gmail.com>
>> ---
> Could you put a list of changes since v2 here?:
>
> v3:  blah blah changelog mostly.
>
> Also this doesn't apply for me against linux-next.
>
> regards,
> dan carpenter
>
There's no change from v2. I was sending the same patch again because 
the last one was lacking good description and i was told (or as i 
understood) that if I'm sending the same patch or patch for the same 
purpose as previous then i should increment version so i did.

I had developed this patch against linux-git, haven't tested that on 
linux-next as i haven't cloned  linux-next yet.

I've started cloning linux-next and as it's not applying on linux-next, 
I'll try it on linux-next (once i cloned it)  and will send again.

Regards
Kumar Gaurav
