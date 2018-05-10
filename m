From: Ido Schimmel <idosch@idosch.org>
Date: Thu, 10 May 2018 11:58:21 +0000
Subject: Re: [PATCH] mlxsw: core: Fix an error handling path in 'mlxsw_core_bus_device_register()'
Message-Id: <20180510115821.GA10270@splinter.mtl.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510112616.20508-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180510112616.20508-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jiri@mellanox.com, idosch@mellanox.com, davem@davemloft.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, May 10, 2018 at 01:26:16PM +0200, Christophe JAILLET wrote:
> Resources are not freed in the reverse order of the allocation.
> Labels are also mixed-up.
> 
> Fix it and reorder code and labels in the error handling path of
> 'mlxsw_core_bus_device_register()'
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

For net:

Fixes: ef3116e5403e ("mlxsw: spectrum: Register KVD resources with devlink")
Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Next time, please indicate the tree you're targeting as explained here:
https://www.kernel.org/doc/Documentation/networking/netdev-FAQ.txt

And include a Fixes line as explained here:
https://www.kernel.org/doc/Documentation/process/submitting-patches.rst

Thanks!
