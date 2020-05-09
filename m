From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 09 May 2020 20:31:59 +0000
Subject: Re: [PATCH] net/sonic: Fix some resource leaks in error handling paths
Message-Id: <9f7ed642-c464-feec-2dfd-13333621492f@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508172557.218132-1-christophe.jaillet@wanadoo.fr>
 <20200508185402.41d9d068@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <50ef36cd-d095-9abe-26ea-d363d11ce521@wanadoo.fr>
 <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200509111321.51419b19@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, fthain@telegraphics.com.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 09/05/2020 à 20:13, Jakub Kicinski a écrit :
> On Sat, 9 May 2020 18:47:08 +0200 Christophe JAILLET wrote:
>> Le 09/05/2020 à 03:54, Jakub Kicinski a écrit :
>>> On Fri,  8 May 2020 19:25:57 +0200 Christophe JAILLET wrote:
>>>> @@ -527,8 +531,9 @@ static int mac_sonic_platform_remove(struct platform_device *pdev)
>>>>    	struct sonic_local* lp = netdev_priv(dev);
>>>>    
>>>>    	unregister_netdev(dev);
>>>> -	dma_free_coherent(lp->device, SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
>>>> -	                  lp->descriptors, lp->descriptors_laddr);
>>>> +	dma_free_coherent(lp->device,
>>>> +			  SIZEOF_SONIC_DESC * SONIC_BUS_SCALE(lp->dma_bitmode),
>>>> +			  lp->descriptors, lp->descriptors_laddr);
>>>>    	free_netdev(dev);
>>>>    
>>>>    	return 0;
>>> This is a white-space only change, right? Since this is a fix we should
>>> avoid making cleanups which are not strictly necessary.
>> Right.
>>
>> The reason of this clean-up is that I wanted to avoid a checkpatch
>> warning with the proposed patch and I felt that having the same layout
>> in the error handling path of the probe function and in the remove
>> function was clearer.
>> So I updated also the remove function.
> I understand the motivation is good.
>
>> Fell free to ignore this hunk if not desired. I will not sent a V2 only
>> for that.
> That's not how it works. Busy maintainers don't have time to hand edit
> patches. I'm not applying this to the networking tree and I'm tossing it
> from patchwork. Please address the basic feedback.
>
> Thank you.
>
Hi,

that's not the way you would like it to work.
It happens that some maintainers make some small adjustments in the 
commit message or the patch itself.

The patch is good enough for me. If you can not accept the additional 
small clean-up, or don't have time to tweak it by yourself, or by anyone 
else, please, just reject it.
The issue I propose to fix is minor and unlikely to happen anyway.

If anyone else cares to update the proposal, please do.


I don't want to discuss your motivation, I understand them.

But please, do also understand mine and do not require too futile things 
from hobbyists.

Spending time only to remove a CR because it does not match your quality 
standard or your expectation of what a patch is, is of no interest for me.
That's why I told I would not send a V2.


It is up to you to accept it as-is, update it or reject it, according to 
the value you think this patch has.

Hoping for your understanding and sorry for wasting your time.

Best regards,
CJ
