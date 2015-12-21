From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Date: Mon, 21 Dec 2015 08:59:12 +0000
Subject: Re: [PATCH] regulator: wm8*: constify regulator_ops structures
Message-Id: <20151221085912.GW6058@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450539084-13982-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450539084-13982-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Liam Girdwood <lgirdwood@gmail.com>, kernel-janitors@vger.kernel.org, Mark Brown <broonie@kernel.org>, patches@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org

On Sat, Dec 19, 2015 at 04:31:24PM +0100, Julia Lawall wrote:
> The regulator_ops structures are never modified, so declare them as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Thanks,
Charles
