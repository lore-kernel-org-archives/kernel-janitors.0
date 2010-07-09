From: David Miller <davem@davemloft.net>
Date: Fri, 09 Jul 2010 06:42:51 +0000
Subject: Re: [PATCH 1/4] ax88796: free irq on error
Message-Id: <20100708.234251.233681044.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1278590996-3122-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1278590996-3122-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, p_gortmaker@yahoo.com, julia@diku.dk, tj@kernel.org, joe@perches.com, netdev@vger.kernel.org

From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu,  8 Jul 2010 16:09:54 +0400

> If ax_ei_open() failed we must free previously requested irq.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Applied.
