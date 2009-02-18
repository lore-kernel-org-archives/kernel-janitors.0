From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:27:01 +0000
Subject: Re: [PATCH 14/43] drivers/net/bonding: fix sparse warnings:
Message-Id: <20090217.172701.10220214.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214211525.23489.61644.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211525.23489.61644.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:15:33 +0100

> Impact: Attribute functions with __acquires(...) and/or __releases(...).
> 
> Fix this sparse warnings:
>   drivers/net/bonding/bond_alb.c:1675:9: warning: context imbalance in 'bond_alb_handle_active_change' - unexpected unlock
>   drivers/net/bonding/bond_alb.c:1742:9: warning: context imbalance in 'bond_alb_set_mac_address' - unexpected unlock
>   drivers/net/bonding/bond_main.c:1025:17: warning: context imbalance in 'bond_do_fail_over_mac' - unexpected unlock
>   drivers/net/bonding/bond_main.c:3195:13: warning: context imbalance in 'bond_info_seq_start' - wrong count at exit
>   drivers/net/bonding/bond_main.c:3234:13: warning: context imbalance in 'bond_info_seq_stop' - unexpected unlock
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
