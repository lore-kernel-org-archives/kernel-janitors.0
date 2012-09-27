From: Sean Young <sean@mess.org>
Date: Thu, 27 Sep 2012 08:58:20 +0000
Subject: Re: drivers/media/rc/iguanair.c:276 iguanair_receiver() error: doing dma on the stack ((null))
Message-Id: <20120927085820.GA26543@pequod.mess.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120926170104.GC25467@localhost>
In-Reply-To: <20120926170104.GC25467@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Fenguang,

On Thu, Sep 27, 2012 at 01:01:04AM +0800, Fengguang Wu wrote:
> Hi Sean,
> 
> FYI, there are new smatch warnings show up in
> 
> tree:   git://git.infradead.org/users/kmpark/linux-samsung commit-list
> commit: 26ff63137c45886169ed102bddd6e90d6c27f00d [media] Add support for the IguanaWorks USB IR Transceiver
> 
>   drivers/media/rc/iguanair.c:211 iguanair_get_features() error: doing dma on the stack ((null))
>   drivers/media/rc/iguanair.c:230 iguanair_get_features() error: doing dma on the stack ((null))
>   drivers/media/rc/iguanair.c:249 iguanair_get_features() error: doing dma on the stack ((null))
> + drivers/media/rc/iguanair.c:276 iguanair_receiver() error: doing dma on the stack ((null))

Ah, that is wrong indeed. Thanks for letting me know! 

I'm working on patch for this for v3.7.


Sean
