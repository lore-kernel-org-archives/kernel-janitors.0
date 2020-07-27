From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Jul 2020 12:48:00 +0000
Subject: Re: [PATCH] trivial: acpi: replace some bitshifts with BIT macro
Message-Id: <20200727124800.GB1913@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200724160239.16284-1-garritfranke@gmail.com>
In-Reply-To: <20200724160239.16284-1-garritfranke@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: garritfra <garritfranke@gmail.com>
Cc: robert.moore@intel.com, rafael.j.wysocki@intel.com, lenb@kernel.org, trivial@kernel.org, linux-acpi@vger.kernel.org, devel@acpica.org, kernel-janitors@vger.kernel.org

This patch introduces two bugs, so perhaps don't send risky changes to
the trivial tree.

On Fri, Jul 24, 2020 at 06:02:39PM +0200, garritfra wrote:
> Signed-off-by: garritfra <garritfranke@gmail.com>

You need a commit message, and your full legal name for both the
From and the Signing.


> ---
>  drivers/acpi/acpica/exfldio.c   | 2 +-
>  drivers/acpi/acpica/utownerid.c | 6 +++---
>  drivers/acpi/bus.c              | 2 +-
>  drivers/acpi/sleep.c            | 2 +-
>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/acpi/acpica/exfldio.c b/drivers/acpi/acpica/exfldio.c
> index ade35ff1c7..92fc702456 100644
> --- a/drivers/acpi/acpica/exfldio.c
> +++ b/drivers/acpi/acpica/exfldio.c
> @@ -298,7 +298,7 @@ acpi_ex_register_overflow(union acpi_operand_object *obj_desc, u64 value)
>  		return (FALSE);
>  	}
>  
> -	if (value >= ((u64) 1 << obj_desc->common_field.bit_length)) {
> +	if (value >= ((u64) BIT(obj_desc->common_field.bit_length))) {

This breaks the code...  The original code casts 1 to 1ULL so we can
shift by 63 but the BIT() macro can only shift by 31.  It should use the
BIT_ULL() macro here.

>  		/*
>  		 * The Value is larger than the maximum value that can fit into
>  		 * the register.
> diff --git a/drivers/acpi/acpica/utownerid.c b/drivers/acpi/acpica/utownerid.c
> index d3525ef8ed..c4e2db2f54 100644
> --- a/drivers/acpi/acpica/utownerid.c
> +++ b/drivers/acpi/acpica/utownerid.c
> @@ -74,13 +74,13 @@ acpi_status acpi_ut_allocate_owner_id(acpi_owner_id *owner_id)
>  			 * int. Some compilers or runtime error detection may flag this as
>  			 * an error.
>  			 */
> -			if (!(acpi_gbl_owner_id_mask[j] & ((u32)1 << k))) {
> +			if (!(acpi_gbl_owner_id_mask[j] & (u32)BIT(k))) {

This cast can be removed.

>  				/*
>  				 * Found a free ID. The actual ID is the bit index plus one,
>  				 * making zero an invalid Owner ID. Save this as the last ID
>  				 * allocated and update the global ID mask.
>  				 */
> -				acpi_gbl_owner_id_mask[j] |= ((u32)1 << k);
> +				acpi_gbl_owner_id_mask[j] |= (u32)BIT(k);
>  
>  				acpi_gbl_last_owner_id_index = (u8)j;
>  				acpi_gbl_next_owner_id_offset = (u8)(k + 1);
> @@ -171,7 +171,7 @@ void acpi_ut_release_owner_id(acpi_owner_id *owner_id_ptr)
>  	/* Decode ID to index/offset pair */
>  
>  	index = ACPI_DIV_32(owner_id);
> -	bit = (u32)1 << ACPI_MOD_32(owner_id);
> +	bit = (u32)BIT(ACPI_MOD_32(owner_id));

Remove.

>  
>  	/* Free the owner ID only if it is valid */
>  
> diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
> index 54002670cb..39ead80c45 100644
> --- a/drivers/acpi/bus.c
> +++ b/drivers/acpi/bus.c
> @@ -233,7 +233,7 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context)
>  		goto out_kfree;
>  	}
>  	/* Need to ignore the bit0 in result code */
> -	errors = *((u32 *)out_obj->buffer.pointer) & ~(1 << 0);
> +	errors = *((u32 *)out_obj->buffer.pointer) & BIT(0);

This removes the ~ so it totally breaks the code.

regards,
dan carpenter
