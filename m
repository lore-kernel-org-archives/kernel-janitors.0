From: Vinod Koul <vinod.koul@linux.intel.com>
Date: Tue, 25 Sep 2012 10:54:46 +0000
Subject: Re: include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
Message-Id: <1348569766.1943.192.camel@vkoul-udesk3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925054417.GA16350@localhost>
In-Reply-To: <20120925054417.GA16350@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2012-09-25 at 13:44 +0800, Fengguang Wu wrote:
> Hi Jon,
> 
> FYI, kernel build failed on
> 
> 528499a7037ebec0636d928f88cd783c618df3c5  dmaengine: add helper function to request a slave DMA channel
> config: x86_64-lkp (attached as .config)
Thanks Feng,

I didnt know that you will pull all branches of the trees, Pleasantly
surprised :)
> 
> All related error/warning messages:
> 
> In file included from include/linux/skbuff.h:31:0,
>                  from security/commoncap.c:21:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/if_ether.h:135,
>                  from include/linux/netdevice.h:29,
>                  from net/socket.c:68:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/if_ether.h:135,
>                  from include/linux/netdevice.h:29,
>                  from include/net/sock.h:51,
>                  from net/sysctl_net.c:19:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/icmpv6.h:82,
>                  from net/compat.c:19:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/if_ether.h:135,
>                  from include/linux/netdevice.h:29,
>                  from net/xfrm/xfrm_policy.c:23:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from net/xfrm/xfrm_user.c:21:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/net/xfrm.h:8,
>                  from net/xfrm/xfrm_algo.c:17:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/net/xfrm.h:8,
>                  from net/xfrm/xfrm_replay.c:22:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/netfilter.h:6,
>                  from include/net/netns/x_tables.h:5,
>                  from include/net/net_namespace.h:19,
>                  from net/xfrm/xfrm_sysctl.c:3:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/if_ether.h:135,
>                  from include/linux/netdevice.h:29,
>                  from net/xfrm/xfrm_output.c:14:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> --
> In file included from include/linux/skbuff.h:31:0,
>                  from include/linux/if_ether.h:135,
>                  from include/linux/netdevice.h:29,
>                  from net/xfrm/xfrm_input.c:12:
> include/linux/dmaengine.h: In function 'dma_request_slave_channel':
> include/linux/dmaengine.h:995:1: error: expected ';' before '}' token
> ..
> 
> vim +995 include/linux/dmaengine.h
>    989		return NULL;
>    990	}
>    991	static inline struct dma_chan *dma_request_slave_channel(struct device *dev,
>    992								 char *name)
>    993	{
>    994		return NULL
>  > 995	}
>    996	static inline void dma_release_channel(struct dma_chan *chan)
>    997	{
>    998	}
Committed this fix now, thanks

-- 
~Vinod

