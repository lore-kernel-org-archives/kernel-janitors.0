From: David Miller <davem@davemloft.net>
Date: Wed, 18 Feb 2009 03:49:33 +0000
Subject: Re: [PATCH 41/43] drivers/net/wireless/b43: fix warning: format
Message-Id: <20090217.194933.98457883.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090214210940.23489.95001.stgit@vmbox.hanneseder.net>
	<20090214214956.24377.19315.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090214214956.24377.19315.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hannes@hanneseder.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 14 Feb 2009 22:50:06 +0100

> Fix this compilation warning:
>   drivers/net/wireless/b43/main.c: In function 'b43_print_fw_helptext':
>   drivers/net/wireless/b43/main.c:1971: warning: format not a string literal and no format arguments
>   drivers/net/wireless/b43/main.c:1973: warning: format not a string literal and no format arguments
> 
> Signed-off-by: Hannes Eder <hannes@hanneseder.net>

Applied.
