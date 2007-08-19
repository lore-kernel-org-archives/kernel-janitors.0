From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Sun, 19 Aug 2007 22:34:22 +0000
Subject: Re: [PATCH 4/5] Documentation/firmware/... convert #include
Message-Id: <20070819153422.1e0b54af.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561972.4200.143.camel@localhost>
In-Reply-To: <1187561972.4200.143.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Markus Rechberger <markus.rechberger@amd.com>

On Sun, 19 Aug 2007 15:19:32 -0700 Joe Perches wrote:

> (untested)
> 
> There are several files that 
> #include "linux/file" not #include <linux/file>
> #include "asm/file" not #include <asm/file>
> 
> Here's a little script that converts them:
> 
> egrep -i -r -l --include=*.[ch] \
> "^[[:space:]]*\#[[:space:]]*include[[:space:]]*\"(linux|asm)/(.*)\"" * \
> | xargs sed -i -e 's/^[[:space:]]*#[[:space:]]*include[[:space:]]*"\(linux\|asm\)\/\(.*\)"/#include <\1\/\2>/g'
> 
> This one is probably wrong.
> 
> It should likely keep firmware.h in
> the same directory as firmware.c
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> 
> diff --git a/Documentation/firmware_class/firmware_sample_driver.c b/Documentation/firmware_class/firmware_sample_driver.c
> index 6865cbe..754ded2 100644
> --- a/Documentation/firmware_class/firmware_sample_driver.c
> +++ b/Documentation/firmware_class/firmware_sample_driver.c
> @@ -13,7 +13,7 @@
>  #include <linux/device.h>
>  #include <linux/string.h>
>  
> -#include "linux/firmware.h"
> +#include "firmware.h"

I believe that it should be <linux/firmware.h>.

>  static struct device ghost_device = {
>  	.bus_id    = "ghost0",


---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
