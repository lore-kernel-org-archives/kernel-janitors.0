From: David Miller <davem@davemloft.net>
Date: Tue, 14 Feb 2017 03:12:39 +0000
Subject: Re: [PATCH 2/2] net: fs_enet: Simplify code
Message-Id: <20170213.221239.2041391041651777898.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170210201719.16636-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170210201719.16636-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: pantelis.antoniou@gmail.com, vbordug@ru.mvista.com, linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 10 Feb 2017 21:17:19 +0100

> There is no need to use an intermediate variable to handle an error code
> in this case.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied.
