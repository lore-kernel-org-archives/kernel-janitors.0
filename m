From: "Gabriel L. Somlo" <somlo@cmu.edu>
Date: Thu, 14 Apr 2016 19:51:26 +0000
Subject: Re: [patch] firmware: qemu_fw_cfg.c: potential unintialized variable
Message-Id: <20160414195126.GF7821@HEDWIG.INI.CMU.EDU>
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
> initialized, which, if you got very unlucky, could cause a bug.
> 
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

After digging through the acpi_[acquire|release]_global_lock() code in
drivers/acpi/acpica/evxface.c, the -1 value actually makes sense, as
glk is set to the value of acpi_gbl_global_lock_handle, which
internally is a 16-bit value which can wrap around, but will never be
equal to 32-bit "-1". As such, the unlock function would fail with
AE_NOT_ACQUIRED if its "for-real" version ever ended up being called.

So, with the typos in the commit blurb fixed (s/It/If/ and
s/return/returns/), and on general "belt-and-suspenders" principle,

Reviewed-by: Gabriel Somlo <somlo@cmu.edu>

I just wanted to make sure my understanding of "this can't happen with
the way the ACPI macros are currently defined" is still correct :)

Thanks,
--Gabe

>  	acpi_status status;
>  
>  	/* If we have ACPI, ensure mutual exclusion against any potential
