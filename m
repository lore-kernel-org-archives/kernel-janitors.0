From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 09 Feb 2021 12:08:04 +0000
Subject: Re: [PATCH] media: i2c: imx334: Fix an error message
Message-Id: <20210209120804.GD32460@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YCJsUCngklBkJMgw@mwanda>
In-Reply-To: <YCJsUCngklBkJMgw@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>, Martina Krasteva <martinax.krasteva@intel.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, Gjorgji Rosikopulos <gjorgjix.rosikopulos@intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Feb 09, 2021 at 02:04:48PM +0300, Dan Carpenter wrote:
> The "ret" variable is uninitialized in this error message.
> 
> Fixes: 9746b11715c3 ("media: i2c: Add imx334 camera sensor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch. This has been already addressed by a patch from Hans
(but not merged yet):

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/917ccfef-b93e-4d90-0b5a-4974145ab187@xs4all.nl/>

> ---
> When new drivers are merged into the kernel, then could we use the
> driver prefix?  In other words something like this:
> 
> media: i2c/imx334: Add imx334 camera sensor driver

We've usually had driver's name and Mauro's scripts add media: prefix ---
unless it's already there. Are you suggesting also the bus should be part
of it?

-- 
Kind regards,

Sakari Ailus
