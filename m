From: David Miller <davem@davemloft.net>
Date: Mon, 16 Feb 2009 07:40:07 +0000
Subject: Re: [PATCH v2] drivers/isdn/hardware/mISDN: change type of
Message-Id: <20090215.234007.25283952.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214230701.21991.75646.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214230701.21991.75646.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, jirislaby@gmail.com

From: Hannes Eder <hannes@hanneseder.net>
Date: Sun, 15 Feb 2009 00:10:33 +0100

> Jiffies are unsigned long, make sure we fit in jiffies store variable
> on archs with bits per long > 32.
> 
> Patch suggested by Jiri Slaby.
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Also applied, thank you.
