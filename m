From: "Kim, Milo" <milo.kim@ti.com>
Date: Mon, 17 Oct 2016 00:40:48 +0000
Subject: Re: [patch] power: supply: lp8788: remove an unneeded NULL check
Message-Id: <58041E10.8020700@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161014073328.GC15168@mwanda>
In-Reply-To: <20161014073328.GC15168@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/14/2016 4:33 PM, Dan Carpenter wrote:
> We checked that "pdata->chg_params" is non-NULL earlier in this function
> so when we add "i" to it, it's still non-NULL.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Milo Kim <milo.kim@ti.com>

Thanks for catching this.

Best regards,
Milo
