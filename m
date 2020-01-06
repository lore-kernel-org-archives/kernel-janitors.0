From: David Miller <davem@redhat.com>
Date: Mon, 06 Jan 2020 21:39:54 +0000
Subject: Re: [PATCH] gtp: simplify error handling code in 'gtp_encap_enable()'
Message-Id: <20200106.133954.516759492863458363.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pablo@netfilter.org, laforge@gnumonks.org, osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun,  5 Jan 2020 18:36:07 +0100

> 'gtp_encap_disable_sock(sk)' handles the case where sk is NULL, so there
> is no need to test it before calling the function.
> 
> This saves a few line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to net-next.
