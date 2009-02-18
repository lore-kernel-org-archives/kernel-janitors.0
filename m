From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 01:40:16 +0000
Subject: Re: [PATCH 28/43] drivers/net/skfp: fix sparse warning: Should it
Message-Id: <20090217.174016.175836359.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214210.24377.32244.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214210.24377.32244.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:43:15 +0100

> Impact: Move function declarations to header file.
> 
> Fix this sparse warnings:
>   drivers/net/skfp/cfm.c:146:6: warning: symbol 'all_selection_criteria' was not declared. Should it be static?
>   drivers/net/skfp/drvfbi.c:186:6: warning: symbol 'mac1_irq' was not declared. Should it be static?
>   drivers/net/skfp/drvfbi.c:284:6: warning: symbol 'read_address' was not declared. Should it be static?
>   drivers/net/skfp/drvfbi.c:323:6: warning: symbol 'init_board' was not declared. Should it be static?
>   drivers/net/skfp/fplustm.c:72:24: warning: symbol 'fddi_broadcast' was not declared. Should it be static?
>   drivers/net/skfp/fplustm.c:679:6: warning: symbol 'mac2_irq' was not declared. Should it be static?
>   drivers/net/skfp/fplustm.c:805:6: warning: symbol 'mac3_irq' was not declared. Should it be static?
>   drivers/net/skfp/fplustm.c:856:5: warning: symbol 'init_fplus' was not declared. Should it be static?
>   drivers/net/skfp/pcmplc.c:404:6: warning: symbol 'init_plc' was not declared. Should it be static?
>   drivers/net/skfp/pcmplc.c:1592:5: warning: symbol 'pcm_status_twisted' was not declared. Should it be static?
>   drivers/net/skfp/smtinit.c:68:5: warning: symbol 'init_smt' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
