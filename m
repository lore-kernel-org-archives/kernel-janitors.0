From: David Miller <davem@davemloft.net>
Date: Fri, 26 Dec 2008 07:59:38 +0000
Subject: Re: [PATCH 08/27] drivers/net/cxgb3: comment out dead code
Message-Id: <20081225.235938.00539364.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20081222191259.11807.53190.stgit@vmbox.hanneseder.net>
	<20081222191603.11807.61006.stgit@vmbox.hanneseder.net>
In-Reply-To: <20081222191603.11807.61006.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Mon, 22 Dec 2008 20:16:03 +0100

> The function 'vsc8211_set_speed_duplex' is not used, so comment it
> out.  For 'vsc8211_set_automdi' the function 'vsc8211_set_speed_duplex'
> is the only caller, so comment it out as well.
> 
> Fix this (sparse) warning:
 ...
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
