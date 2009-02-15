From: Florian Fainelli <florian@openwrt.org>
Date: Sun, 15 Feb 2009 14:00:06 +0000
Subject: Re: [PATCH 09/43] drivers/net/r6040.c: fix sparse warning: Using plain integer as NULL pointer
Message-Id: <200902151500.06516.florian@openwrt.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net> <20090214211400.23489.24726.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214211400.23489.24726.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello Hannes,

Le Saturday 14 February 2009 22:14:04 Hannes Eder, vous avez écrit :
> Fix this sparse warnings:
>   drivers/net/r6040.c:487:31: warning: Using plain integer as NULL pointer
>   drivers/net/r6040.c:492:31: warning: Using plain integer as NULL pointer

Good catch, thanks.
>
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Acked-by: Florian Fainelli <florian@openwrt.org>
-- 
Best regards, Florian Fainelli
Email : florian@openwrt.org
http://openwrt.org
-------------------------------
