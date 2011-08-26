From: walter harms <wharms@bfs.de>
Date: Fri, 26 Aug 2011 10:46:15 +0000
Subject: Re: [patch] dwc3: add a kfree() on error to dwc3_testmode_open()
Message-Id: <4E577977.3010407@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110826092113.GO5975@shale.localdomain>
In-Reply-To: <20110826092113.GO5975@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 26.08.2011 12:32, schrieb Sebastian Andrzej Siewior:
> * Dan Carpenter | 2011-08-26 12:21:13 [+0300]:
> 
>> Btw.  This function returns -EBUSY on success.  Was that really what
>> you want?
> 
> At that time yes. The idea was to enable the self-test mode of the core
> and let it do transfers forth and back and see if it works. There is
> also no off switch. I wasn't aware that this piece of code is going to
> merged but now I think we need an off switch.
> Thanks for spotting this.
> 
> Sebastian

I assume that is true for the memset() also ?
so they can be remove safely ?

re,
 wh
