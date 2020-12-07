From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Mon, 07 Dec 2020 13:14:47 +0000
Subject: Re: [PATCH] media: i2c: ov02a10: fix an uninitialized return
Message-Id: <20201207131446.GA852@paasikivi.fi.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X84nbdgv0a/ak2ef@mwanda>
In-Reply-To: <X84nbdgv0a/ak2ef@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dongchun Zhu <dongchun.zhu@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Mon, Dec 07, 2020 at 04:00:29PM +0300, Dan Carpenter wrote:
> The "ret" variable isn't set on the no-op path where we are setting to
> on/off and it's in the on or off state already.
> 
> Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch.

This issue has been fixed by another patch here:

<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20201204082037.1658297-1-arnd@kernel.org/>

-- 
Kind regards,

Sakari Ailus
