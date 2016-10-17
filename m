From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 17 Oct 2016 15:40:09 +0000
Subject: Re: [patch v2] netfilter: nf_tables: underflow in nft_parse_u32_check()
Message-Id: <20161017154009.GA15655@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAML_gOedjw6uJqp13YkGfXoLQTd_ikOC8OoUA4oXv15RYsgoUg@mail.gmail.com>
 <20161012091429.GA27317@mwanda>
In-Reply-To: <20161012091429.GA27317@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Laura Garcia Liebana <nevola@gmail.com>, Patrick McHardy <kaber@trash.net>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, "David S. Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 12, 2016 at 12:14:29PM +0300, Dan Carpenter wrote:
> We don't want to allow negatives here.

Applied, thanks.
