From: David Miller <davem@davemloft.net>
Date: Wed, 16 Nov 2011 23:14:08 +0000
Subject: Re: [patch -next v2] 6LoWPAN: double free in lowpan_fragment_xmit()
Message-Id: <20111116.181408.1718342285438189705.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111116083254.GB4349@mwanda>
	<20111116083643.GA25612@mwanda>
	<CAJmB2rBTHCTcetstpZkNkxX4CAxYF3Sd=Vrg3dmTMDzFQK0vqg@mail.gmail.com>
In-Reply-To: <CAJmB2rBTHCTcetstpZkNkxX4CAxYF3Sd=Vrg3dmTMDzFQK0vqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alex.bluesman.smirnov@gmail.com
Cc: dan.carpenter@oracle.com, dbaryshkov@gmail.com, slapin@ossfans.org, linux-zigbee-devel@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>
Date: Wed, 16 Nov 2011 11:42:07 +0300

> 2011/11/16 Dan Carpenter <dan.carpenter@oracle.com>:
>> dev_queue_xmit() consumes its own skb, so the call to dev_kfree_skb()
>> in lowpan_fragment_xmit() is a double free.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
 ...
> 
> Acked-by: Alexander Smirnov <alex.bluesman.smirnov@gmail.com>

Applied, thanks.
