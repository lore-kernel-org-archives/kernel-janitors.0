From: David Miller <davem@davemloft.net>
Date: Thu, 27 Mar 2014 19:29:00 +0000
Subject: Re: [PATCH 7/7] yam: replace del_timer by del_timer_sync
Message-Id: <20140327.152900.610693492229362700.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1395869625-15209-1-git-send-email-Julia.Lawall@lip6.fr>
	<1395869625-15209-8-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1395869625-15209-8-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: jpr@f6fbb.org, kernel-janitors@vger.kernel.org, tglx@linutronix.de, linux-hams@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 26 Mar 2014 22:33:45 +0100

> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Use del_timer_sync to ensure that the timer is stopped on all CPUs before
> the driver exists.
> 
> This change was suggested by Thomas Gleixner
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
