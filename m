From: David Miller <davem@davemloft.net>
Date: Thu, 19 Aug 2010 07:05:52 +0000
Subject: Re: [PATCH] greth: Use return value of register_netdev
Message-Id: <20100819.000552.220051390.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1282061484-19377-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1282061484-19377-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tklauser@distanz.ch
Cc: kristoffer@gaisler.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 17 Aug 2010 18:11:24 +0200

> Use the return value provided by register_netdev on error instead of
> hard setting it to -ENOMEM.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied.
