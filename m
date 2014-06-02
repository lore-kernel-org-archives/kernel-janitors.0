From: walter harms <wharms@bfs.de>
Date: Mon, 02 Jun 2014 07:45:34 +0000
Subject: Re: [PATCH 2/2] lpc_eth: Use resource_size instead of computation
Message-Id: <538C2B9E.8070409@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401290047-30005-3-git-send-email-benoit.taine@lip6.fr>
In-Reply-To: <1401290047-30005-3-git-send-email-benoit.taine@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 02.06.2014 04:27, schrieb David Miller:
> From: Benoit Taine <benoit.taine@lip6.fr>
> Date: Wed, 28 May 2014 17:14:07 +0200
> 
>> @@ -1419,8 +1419,7 @@ static int lpc_eth_drv_probe(struct platform_device *pdev)
>>  
>>  	netdev_dbg(ndev, "IO address start     :0x%08x\n",
>>  			res->start);
>> -	netdev_dbg(ndev, "IO address size      :%d\n",
>> -			res->end - res->start + 1);
>> +	netdev_dbg(ndev, "IO address size      :%d\n", resource_size(res));
>>  	netdev_dbg(ndev, "IO address (mapped)  :0x%p\n",
>>  			pldat->net_base);
> 
> Please replace all of this with %pR as suggested by Joe, thanks.

Just for my curiosity: what does %pR mean ? (%p is ok, what is R ?)

re,
 wh


