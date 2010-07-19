From: David Miller <davem@davemloft.net>
Date: Mon, 19 Jul 2010 16:28:20 +0000
Subject: Re: [PATCH] s2io: Remove unnecessary memset of netdev private data
Message-Id: <20100719.092820.24567424.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279529758-7901-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1279529758-7901-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 19 Jul 2010 10:55:58 +0200

> The memory for the private data is allocated using kzalloc in
> alloc_etherdev (or alloc_netdev_mq respectively) so there is no need to
> set it to 0 again.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied, thanks.
