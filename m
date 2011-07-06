From: Samuel Ortiz <sameo@linux.intel.com>
Date: Wed, 06 Jul 2011 19:07:21 +0000
Subject: Re: [patch] regulator/tps65912: storing error codes in u8
Message-Id: <20110706190721.GB30759@sortiz-mobl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110623055715.GM14591@shale.localdomain>
 <1309795618.3272.9.camel@odin>
 <20110706183208.GK3021@sortiz-mobl>
 <20110706185718.GJ18655@shale.localdomain>
In-Reply-To: <20110706185718.GJ18655@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Liam Girdwood <lrg@kernel.org>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Dan,

On Wed, Jul 06, 2011 at 09:57:18PM +0300, Dan Carpenter wrote:
> get_ctrl_reg() returns -EINVAL so the error handling won't work here
> if reg is a u8.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Thanks, patch applied.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
