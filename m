From: walter harms <wharms@bfs.de>
Date: Tue, 27 Mar 2012 07:44:42 +0000
Subject: Re: [patch] mISDN: array underflow in open_bchannel()
Message-Id: <4F716FEA.4000307@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327072048.GC19008@elgon.mountain>
In-Reply-To: <20120327072048.GC19008@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.03.2012 09:39, schrieb Dan Carpenter:
> On Tue, Mar 27, 2012 at 09:31:45AM +0200, walter harms wrote:
>>
>> hi dan,
>> short question: is is possible to make rq->adr.channel unsigned ?
>>
> 
> It is unsigned.  It's a u8.
> 

> 
i am still sleeping ... i did not see that you are checking x = 0 i was seeing x<0
sorry for the noise.

re,
 wh
