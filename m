From: "Gabriel L. Somlo" <somlo@cmu.edu>
Date: Thu, 14 Apr 2016 18:40:06 +0000
Subject: Re: [patch] firmware: qemu_fw_cfg.c: potential unintialized variable
Message-Id: <20160414184005.GC7821@HEDWIG.INI.CMU.EDU>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414093337.GD16549@mwanda>
In-Reply-To: <20160414093337.GD16549@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Apr 14, 2016 at 12:33:37PM +0300, Dan Carpenter wrote:
> It acpi_acquire_global_lock() return AE_NOT_CONFIGURED then "glk" isn't
  ^                               ^
  If                            returns

> initialized, which, if you got very unlucky, could cause a bug.


In principle I'm OK with being cautious and initializing local
variables just in case, but I'm curious:

acpi_acquire_global_lock() (and its friend, acpi_release_global_lock())
are both wrapped inside the same macro -- ACPI_HW_DEPENDENT_RETURN_STATUS
-- which either makes them both do something useful, or makes them both
no-ops returning a hardcoded AE_NOT_CONFIGURED.

So what else do you think could be a way to get very unlucky ?

Otherwise, sure: Just 'cause we're paranoid doesn't mean someone's not
out to get us! :)

Thanks,
--Gabriel

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
> index d999fe3..0e20116 100644
> --- a/drivers/firmware/qemu_fw_cfg.c
> +++ b/drivers/firmware/qemu_fw_cfg.c
> @@ -77,7 +77,7 @@ static inline u16 fw_cfg_sel_endianness(u16 key)
>  static inline void fw_cfg_read_blob(u16 key,
>  				    void *buf, loff_t pos, size_t count)
>  {
> -	u32 glk;
> +	u32 glk = -1U;
>  	acpi_status status;
>  
>  	/* If we have ACPI, ensure mutual exclusion against any potential
