From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 03 Jun 2017 10:22:33 +0000
Subject: Re: [PATCH v2 1/1] w1: Add subsystem kernel public interface
Message-Id: <20170603102233.GA19112@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170516200814.12360-1-afd@ti.com>
 <20170516200814.12360-2-afd@ti.com>
In-Reply-To: <20170516200814.12360-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 16, 2017 at 03:08:14PM -0500, Andrew F. Davis wrote:
> Like other subsystems we should be able to define slave devices outside
> of the w1 directory. To do this we move public facing interface
> definitions to include/linux/w1.h and rename the internal definition
> file to w1_internal.h.
> 
> As w1_family.h and w1_int.h contained almost entirely public
> driver interface definitions we simply removed these files and
> moved the remaining definitions into w1_internal.h.
> 
> With this we can now start to move slave devices out of w1/slaves and
> into the subsystem based on the function they implement, again like
> other drivers.
> 
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Reviewed-by: Sebastian Reichel <sre@kernel.org>

This breaks the build for me:
  CC [M]  drivers/power/supply/ds2760_battery.o
drivers/power/supply/ds2760_battery.c:31:10: fatal error: ../../w1/w1.h: No such file or directory
 #include "../../w1/w1.h"
          ^~~~~~~~~~~~~~~
compilation terminated.


So there was w1 drivers outside of the drivers/w1/ directory :)

Please fix and resend.

thanks,

greg k-h
