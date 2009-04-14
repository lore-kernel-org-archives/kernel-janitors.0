From: Mark Brown <broonie@sirena.org.uk>
Date: Tue, 14 Apr 2009 10:02:48 +0000
Subject: Re: [PATCH] drivers/regulator: fix when type is different from
Message-Id: <20090414100248.GD12678@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49E3E12F.20808@gmail.com>
In-Reply-To: <49E3E12F.20808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Apr 14, 2009 at 03:04:47AM +0200, Diego Liziero wrote:

> From: Diego Liziero <diegoliz@gmail.com>
> 
> When regulator_desc->type is something different from REGULATOR_VOLTAGE or REGULATOR_CURRENT
> the if should probably return ERR_PTR(-EINVAL)
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)

Acked-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
