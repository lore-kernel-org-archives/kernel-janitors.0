From: David Miller <davem@davemloft.net>
Date: Wed, 21 Jul 2010 21:04:04 +0000
Subject: Re: [PATCH 11/19] drivers/net/irda: use for_each_pci_dev()
Message-Id: <20100721.140404.168047053.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278173056-11779-1-git-send-email-segooon@gmail.com>
	<alpine.LNX.2.00.1007201732370.4741@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1007201732370.4741@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jkosina@suse.cz
Cc: segooon@gmail.com, kernel-janitors@vger.kernel.org, samuel@sortiz.org, shemminger@vyatta.com, joe@perches.com, eric.dumazet@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 20 Jul 2010 17:33:01 +0200 (CEST)

> On Sat, 3 Jul 2010, Kulikov Vasiliy wrote:
> 
>> Use for_each_pci_dev() to simplify the code.
>> 
>> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
>> ---
...
> Doesn't seem to hit linux-next as of today. Dave, are you going to merge 
> it?

I'll apply this now, thanks.
