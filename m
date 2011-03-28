From: David Miller <davem@davemloft.net>
Date: Mon, 28 Mar 2011 01:39:02 +0000
Subject: Re: [PATCH 3/3] tg3: Fix inline keyword usage
Message-Id: <20110327.183902.212698820.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1301193753-10045-1-git-send-email-martinez.javier@gmail.com>
	<1301193753-10045-3-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1301193753-10045-3-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: martinez.javier@gmail.com
Cc: mcarlson@broadcom.com, mchan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sun, 27 Mar 2011 04:42:33 +0200

> The correct usage is "static inline void" not "static void inline".
> 
> Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>

Applied.
