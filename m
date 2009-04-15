From: Liam Girdwood <lrg@slimlogic.co.uk>
Date: Wed, 15 Apr 2009 15:53:04 +0000
Subject: Re: [PATCH] drivers/regulator: fix when type is different from
Message-Id: <1239810784.27410.1786.camel@vega.slimlogic.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <49E3E12F.20808@gmail.com>
In-Reply-To: <49E3E12F.20808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 2009-04-14 at 03:04 +0200, Diego Liziero wrote:
> From: Diego Liziero <diegoliz@gmail.com>
> 
> When regulator_desc->type is something different from REGULATOR_VOLTAGE or REGULATOR_CURRENT
> the if should probably return ERR_PTR(-EINVAL)
> 
> The semantic patch that makes this change is as follows:
> (http://www.emn.fr/x-info/coccinelle/)
> 
> @@ expression E; constant C; @@
> (
> - !E = C
> + E != C
> )
> 
> Signed-off-by: Diego Liziero <diegoliz@gmail.com>
> 

Applied.

Thanks

Liam

