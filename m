From: Simon Horman <simon.horman@netronome.com>
Date: Mon, 06 Jan 2020 08:59:43 +0000
Subject: Re: [PATCH] gtp: simplify error handling code in 'gtp_encap_enable()'
Message-Id: <20200106085943.GB10460@netronome.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200105173607.5456-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: pablo@netfilter.org, laforge@gnumonks.org, davem@davemloft.net, osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Jan 05, 2020 at 06:36:07PM +0100, Christophe JAILLET wrote:
> 'gtp_encap_disable_sock(sk)' handles the case where sk is NULL, so there
> is no need to test it before calling the function.
> 
> This saves a few line of code.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <simon.horman@netronome.com>
