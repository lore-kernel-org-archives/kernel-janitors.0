From: walter harms <wharms@bfs.de>
Date: Thu, 20 Oct 2011 11:22:57 +0000
Subject: Re: [IEEE802.15.4][6LoWPAN] draft for fragmentation support
Message-Id: <4EA00491.6060402@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111020111718.GA32181@avtobot.ww600.siemens.net>
In-Reply-To: <20111020111718.GA32181@avtobot.ww600.siemens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi Alexander,
I am not sure that the Kernel Janitors List is the right place for that task.

re,
 wh


Am 20.10.2011 13:17, schrieb Alexander Smirnov:
> Hello everybody,
> 
> below is the patch which adds support for fragmentation in 6LoWPAN
> point to point networks. This activity needs because of difference
> in MTU: 1280 ipv6 and 128 ieee802.15.4
> 
> This patch is just a draft. Could anyone please look at
> it and let me know your opinion.
> 
> The most doubtful moments for me are:
> 1. Should the list 'frag_list' and the mutex 'flist_lock' be
> included into dev private data?
> 2. Can I use 'dev_queue_xmit' to send fragments to queue?
> 3. Creating new 'skb' instead of copying and modifying main one.
> 
> With best regards,
> Alexander
> 
