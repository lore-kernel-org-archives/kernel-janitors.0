From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:35:46 +0000
Subject: Re: [PATCH 40/43] drivers/net/wireless/ath9k: fix sparse warnings:
Message-Id: <20090217.193546.115478499.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214935.24377.69824.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214935.24377.69824.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:49:48 +0100

> Impact: Make symbols static.
> 
> Fix this sparse warnings:
>   drivers/net/wireless/ath9k/eeprom.c:1343:5: warning: symbol 'ath9k_hw_4k_get_spur_channel' was not declared. Should it be static?
>   drivers/net/wireless/ath9k/eeprom.c:1372:19: warning: symbol 'eep_4k_ops' was not declared. Should it be static?
>   drivers/net/wireless/ath9k/eeprom.c:2649:5: warning: symbol 'ath9k_hw_def_get_spur_channel' was not declared. Should it be static?
>   drivers/net/wireless/ath9k/eeprom.c:2678:19: warning: symbol 'eep_def_ops' was not declared. Should it be static?
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
