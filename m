From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 May 2018 12:41:39 +0000
Subject: Re: [PATCH] mlxsw: core: Fix an error handling path in 'mlxsw_core_bus_device_register()'
Message-Id: <20180510124138.6yerbsfcl3abqtmq@mwanda>
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
> ---
> Please review carefully. This patch is proposed because it triggers one of
> my coccinelle scripts. I'm not 100% sure if correct.
> 

Looks correct.

The err = mlxsw_driver->resources_register(mlxsw_core); pointer is a
pointer to mlxsw_sp_resources_register().  That function doesn't clean
up after itself on failure.  Ideally, you'd want a matching
mlxsw_driver->resources_unregister as well pointer instead of hard
coding devlink_resources_unregister().

The error handling would be easier to review if the gotos told you what
the did.  Right now they're written in "come from" style so the tell you
what happened on the line before.

	if (!foo)
		goto allocating_foo_failed;

Hopefully if someone fixes mlxsw_sp_resources_register() they'll choose
better label names.

regards,
dan carpenter

