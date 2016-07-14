From: Jiri Pirko <jiri@resnulli.us>
Date: Thu, 14 Jul 2016 06:28:19 +0000
Subject: Re: [PATCH] mlxsw: spectrum_router: Return -ENOENT in case of error
Message-Id: <20160714062819.GB2228@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468477125-3153-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468477125-3153-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jiri@mellanox.com, idosch@mellanox.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thu, Jul 14, 2016 at 08:18:45AM CEST, christophe.jaillet@wanadoo.fr wrote:
>'vr' should be a valid pointer here, so returning 'PTR_ERR(vr)' is wrong.
>Return an explicit error code (-ENOENT) instead.
>

This is fo net-next.

Fixes: 61c503f976 ("mlxsw: spectrum_router: Implement fib4 add/del switchdev obj ops")

>Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Acked-by: Jiri Pirko <jiri@mellanox.com>


Thanks.
