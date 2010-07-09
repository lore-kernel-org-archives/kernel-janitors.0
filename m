From: David Miller <davem@davemloft.net>
Date: Fri, 09 Jul 2010 06:44:42 +0000
Subject: Re: [PATCH 4/4] fec_mpc52xx: fix error path
Message-Id: <20100708.234442.68149385.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278591018-3724-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278591018-3724-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, grant.likely@secretlab.ca, jpirko@redhat.com, eric.dumazet@gmail.com, smaclennan@pikatech.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu,  8 Jul 2010 16:10:16 +0400

> Error path in mpc52xx_fec_probe() is broken.
> We must free everything that we've allocated.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Also applied, thanks.
