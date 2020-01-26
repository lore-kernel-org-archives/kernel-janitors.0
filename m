From: Ido Schimmel <idosch@idosch.org>
Date: Sun, 26 Jan 2020 08:19:41 +0000
Subject: Re: [PATCH] mlxsw: minimal: Fix an error handling path in 'mlxsw_m_port_create()'
Message-Id: <20200126081941.GA794072@splinter>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200125211847.12755-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200125211847.12755-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jiri@mellanox.com, idosch@mellanox.com, davem@davemloft.net, vadimp@mellanox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 25, 2020 at 10:18:47PM +0100, Christophe JAILLET wrote:
> An 'alloc_etherdev()' called is not ballanced by a corresponding
> 'free_netdev()' call in one error handling path.
> 
> Slighly reorder the error handling code to catch the missed case.
> 
> Fixes: c100e47caa8e ("mlxsw: minimal: Add ethtool support")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For net:

Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Thanks!
