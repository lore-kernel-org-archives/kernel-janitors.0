From: "Kok, Auke" <auke-jan.h.kok@intel.com>
Date: Thu, 06 Mar 2008 18:07:54 +0000
Subject: Re: [E1000-devel] [PATCH] drivers/net: convert & to &&
Message-Id: <47D032FA.9000909@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0803061841000.1669@pc-041.diku.dk> <1204826347.5541.20.camel@localhost>
In-Reply-To: <1204826347.5541.20.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Julia Lawall <julia@diku.dk>, e1000-devel@lists.sourceforge.net, xfs-masters <xfs-masters@oss.sgi.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Joe Perches wrote:
> On Thu, 2008-03-06 at 18:41 +0100, Julia Lawall wrote:
>> diff -u -p a/drivers/net/e1000/e1000_main.c b/drivers/net/e1000/e1000_main.c
>> --- a/drivers/net/e1000/e1000_main.c	2008-02-20 22:09:26.000000000 +0100
>> +++ b/drivers/net/e1000/e1000_main.c	2008-03-06 17:30:20.000000000 +0100
>> @@ -3872,10 +3872,12 @@ e1000_intr_msi(int irq, void *data)
>>  	adapter->total_tx_packets = 0;
>>  	adapter->total_rx_packets = 0;
>>
>> -	for (i = 0; i < E1000_MAX_INTR; i++)
>> -		if (unlikely(!adapter->clean_rx(adapter, adapter->rx_ring) &
>> -		   !e1000_clean_tx_irq(adapter, adapter->tx_ring)))
>> +	for (i = 0; i < E1000_MAX_INTR; i++) {
>> +		boolean_t c1 = adapter->clean_rx(adapter, adapter->rx_ring);
>> +		boolean_t c2 = e1000_clean_tx_irq(adapter, adapter->tx_ring);
>> +		if (unlikely(!c1 && !c2))
>>  			break;
>> +	}
> 
> Perhaps also a s/boolean_t/bool/g kernel wide?

send me a patch for e1000 and for ixgb and I'll happily apply those :)

(which, BTW also could use the uint32_t -> u32 (etc) changes... while you're at it)

Auke


> 
> $ grep -wrl boolean_t *
> 
> drivers/net/e1000/e1000.h
> drivers/net/e1000/e1000_ethtool.c
> drivers/net/e1000/e1000_hw.c
> drivers/net/e1000/e1000_hw.h
> drivers/net/e1000/e1000_main.c
> drivers/net/e1000/e1000_osdep.h
> drivers/net/ixgb/ixgb.h
> drivers/net/ixgb/ixgb_ee.c
> drivers/net/ixgb/ixgb_ee.h
> drivers/net/ixgb/ixgb_ethtool.c
> drivers/net/ixgb/ixgb_hw.c
> drivers/net/ixgb/ixgb_hw.h
> drivers/net/ixgb/ixgb_main.c
> drivers/net/ixgb/ixgb_osdep.h
> fs/xfs/quota/xfs_dquot.c
> fs/xfs/quota/xfs_qm.c
> fs/xfs/quota/xfs_qm.h
> fs/xfs/quota/xfs_qm_syscalls.c
> fs/xfs/quota/xfs_trans_dquot.c
> fs/xfs/xfs_ialloc.c
> fs/xfs/xfs_ialloc.h
> fs/xfs/xfs_inode.c
> fs/xfs/xfs_inode.h
> fs/xfs/xfs_log.c
> fs/xfs/xfs_vfsops.c
> fs/xfs/xfs_utils.c
> fs/xfs/xfs_types.h
> fs/xfs/xfs_vnodeops.c
> 
> 
> 
> -------------------------------------------------------------------------
> This SF.net email is sponsored by: Microsoft
> Defy all challenges. Microsoft(R) Visual Studio 2008.
> http://clk.atdmt.com/MRT/go/vse0120000070mrt/direct/01/
> _______________________________________________
> E1000-devel mailing list
> E1000-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/e1000-devel

