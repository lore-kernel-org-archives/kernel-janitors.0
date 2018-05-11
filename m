From: David Miller <davem@davemloft.net>
Date: Fri, 11 May 2018 15:57:13 +0000
Subject: Re: [PATCH] mlxsw: core: Fix an error handling path in 'mlxsw_core_bus_device_register()'
Message-Id: <20180511.115713.2289767709982338990.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510112616.20508-1-christophe.jaillet@wanadoo.fr>
        <20180510115821.GA10270@splinter.mtl.com>
In-Reply-To: <20180510115821.GA10270@splinter.mtl.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: idosch@idosch.org
Cc: christophe.jaillet@wanadoo.fr, jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Ido Schimmel <idosch@idosch.org>
Date: Thu, 10 May 2018 14:58:21 +0300

> On Thu, May 10, 2018 at 01:26:16PM +0200, Christophe JAILLET wrote:
>> Resources are not freed in the reverse order of the allocation.
>> Labels are also mixed-up.
>> 
>> Fix it and reorder code and labels in the error handling path of
>> 'mlxsw_core_bus_device_register()'
>> 
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> For net:
> 
> Fixes: ef3116e5403e ("mlxsw: spectrum: Register KVD resources with devlink")
> Reviewed-by: Ido Schimmel <idosch@mellanox.com>

Applied and queued up for -stable, thanks.
