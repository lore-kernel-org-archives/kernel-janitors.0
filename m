From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 23 Jun 2011 10:35:47 +0000
Subject: Re: [patch] regulator/tps65912: storing error codes in u8
Message-Id: <20110623103547.GB21932@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110623055715.GM14591@shale.localdomain>
In-Reply-To: <20110623055715.GM14591@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lrg@ti.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jun 23, 2011 at 08:57:15AM +0300, Dan Carpenter wrote:
> get_ctrl_reg() returns -EINVAL so the error handling won't work here
> if reg is a u8.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
