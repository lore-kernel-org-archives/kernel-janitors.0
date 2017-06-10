From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 10 Jun 2017 12:51:14 +0000
Subject: Re: [PATCH v3 1/1] w1: Add subsystem kernel public interface
Message-Id: <20170610125114.GA3128@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170605135208.24807-1-afd@ti.com>
 <20170605135208.24807-2-afd@ti.com>
In-Reply-To: <20170605135208.24807-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Andrew F. Davis" <afd@ti.com>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, Sebastian Reichel <sre@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jun 05, 2017 at 08:52:08AM -0500, Andrew F. Davis wrote:
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
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>
> ---
>  MAINTAINERS                           |   1 +
>  drivers/power/supply/ds2760_battery.c |   2 +-
>  drivers/power/supply/ds2780_battery.c |   2 +-
>  drivers/power/supply/ds2781_battery.c |   2 +-
>  drivers/w1/masters/ds1wm.c            |   3 +-
>  drivers/w1/masters/ds2482.c           |   3 +-
>  drivers/w1/masters/ds2490.c           |   3 +-
>  drivers/w1/masters/matrox_w1.c        |   3 +-
>  drivers/w1/masters/mxc_w1.c           |   3 +-
>  drivers/w1/masters/omap_hdq.c         |   3 +-
>  drivers/w1/masters/w1-gpio.c          |   3 +-
>  drivers/w1/slaves/w1_bq27000.c        |   6 +-
>  drivers/w1/slaves/w1_ds2405.c         |   5 +-
>  drivers/w1/slaves/w1_ds2406.c         |   6 +-
>  drivers/w1/slaves/w1_ds2408.c         |   6 +-
>  drivers/w1/slaves/w1_ds2413.c         |   6 +-
>  drivers/w1/slaves/w1_ds2423.c         |   6 +-
>  drivers/w1/slaves/w1_ds2431.c         |   6 +-
>  drivers/w1/slaves/w1_ds2433.c         |   6 +-
>  drivers/w1/slaves/w1_ds2438.c         |   5 +-
>  drivers/w1/slaves/w1_ds2760.c         |   7 ++-
>  drivers/w1/slaves/w1_ds2780.c         |   7 ++-
>  drivers/w1/slaves/w1_ds2781.c         |   7 ++-
>  drivers/w1/slaves/w1_ds28e04.c        |   6 +-
>  drivers/w1/slaves/w1_smem.c           |   7 ++-
>  drivers/w1/slaves/w1_therm.c          |  10 ++-
>  drivers/w1/w1.c                       |   6 +-
>  drivers/w1/w1_family.c                |   3 +-
>  drivers/w1/w1_family.h                |  98 -----------------------------
>  drivers/w1/w1_int.c                   |   3 +-
>  drivers/w1/w1_int.h                   |  27 --------
>  drivers/w1/w1_internal.h              |  87 ++++++++++++++++++++++++++
>  drivers/w1/w1_io.c                    |   2 +-
>  drivers/w1/w1_netlink.c               |   2 +-
>  drivers/w1/w1_netlink.h               |   2 +-
>  {drivers/w1 => include/linux}/w1.h    | 114 +++++++++++++++-------------------
>  36 files changed, 208 insertions(+), 260 deletions(-)
>  delete mode 100644 drivers/w1/w1_family.h
>  delete mode 100644 drivers/w1/w1_int.h
>  create mode 100644 drivers/w1/w1_internal.h
>  rename {drivers/w1 => include/linux}/w1.h (76%)

You forgot to update Documentation/DocBook/w1.tmpl, and now the
documentation build breaks :(

Can you please send me a patch to fix that up?

thanks,

greg k-h
