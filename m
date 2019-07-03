From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Wed, 03 Jul 2019 11:38:54 +0000
Subject: Re: [PATCH] netfilter: nf_log: Replace a seq_printf() call by seq_puts() in seq_show()
Message-Id: <20190703113854.swp66npj5ojthkp5@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7d397c8-4f41-1831-505f-b3fbcc3663fb@web.de>
In-Reply-To: <c7d397c8-4f41-1831-505f-b3fbcc3663fb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Florian Westphal <fw@strlen.de>, Jozsef Kadlecsik <kadlec@netfilter.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Jul 02, 2019 at 08:11:53PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 Jul 2019 20:06:30 +0200
> 
> A string which did not contain a data format specification should be put
> into a sequence. Thus use the corresponding function “seq_puts”.
> 
> This issue was detected by using the Coccinelle software.

Applied, thanks.
