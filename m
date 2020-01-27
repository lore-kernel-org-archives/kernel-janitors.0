From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jan 2020 10:14:42 +0000
Subject: Re: [PATCH] mlxsw: minimal: Fix an error handling path in 'mlxsw_m_port_create()'
Message-Id: <20200127.111442.1993972247561151893.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200125211847.12755-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200125211847.12755-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: jiri@mellanox.com, idosch@mellanox.com, vadimp@mellanox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 25 Jan 2020 22:18:47 +0100

> An 'alloc_etherdev()' called is not ballanced by a corresponding
> 'free_netdev()' call in one error handling path.
> 
> Slighly reorder the error handling code to catch the missed case.
> 
> Fixes: c100e47caa8e ("mlxsw: minimal: Add ethtool support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied and queued up for -stable, thanks.
