From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 09 Dec 2015 10:47:20 +0000
Subject: Re: [patch -next] mlxsw: spectrum: fix some error handling
Message-Id: <20151209104720.GA2340@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209103351.GI3173@mwanda>
In-Reply-To: <20151209103351.GI3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Dec 09, 2015 at 11:33:51AM CET, dan.carpenter@oracle.com wrote:
>The "err = " assignment is missing here.
>
>Fixes: 0d65fc13042f ('mlxsw: spectrum: Implement LAG port join/leave')
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>

Thanks.
