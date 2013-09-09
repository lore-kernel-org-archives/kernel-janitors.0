From: "Zheng, Lv" <lv.zheng@intel.com>
Date: Mon, 09 Sep 2013 23:29:24 +0000
Subject: RE: [PATCH] ACPICIA: kfree() NULL pointer cleanup
Message-Id: <1AE640813FDE7649BE1B193DEA596E8802461396@SHSMSX101.ccr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378566444-15908-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1378566444-15908-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The codes below should also be maintained in the ACPICA so that we won't introduce unwanted source differences between the Linux and the ACPICA.

Thanks and best regards
-Lv

> -----Original Message-----
> From: Bojan Prtvar [mailto:prtvar.b@gmail.com]
> Sent: Saturday, September 07, 2013 11:07 PM
> To: lenb@kernel.org; rjw@sisk.pl; Zheng, Lv; Moore, Robert; Guan, Chao; Tang, Feng
> Cc: kernel-janitors@vger.kernel.org; Bojan Prtvar
> Subject: [PATCH] ACPICIA: kfree() NULL pointer cleanup
> 
> Checking for NULL pointers before kfree() is redundant.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
> This is janitorial work, please review carefully.
> 
>  drivers/acpi/acpica/evgpeblk.c |    8 ++------
>  drivers/acpi/acpica/evrgnini.c |    4 +---
>  drivers/acpi/acpica/evxfgpe.c  |    4 +---
>  drivers/acpi/acpica/exfldio.c  |    4 +---
>  drivers/acpi/acpica/exnames.c  |    4 +---
>  drivers/acpi/acpica/nsxfname.c |   16 ++++------------
>  drivers/acpi/acpica/uterror.c  |    4 +---
>  7 files changed, 11 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/acpi/acpica/evgpeblk.c b/drivers/acpi/acpica/evgpeblk.c
> index c1aa1ed..c25446e 100644
> --- a/drivers/acpi/acpica/evgpeblk.c
> +++ b/drivers/acpi/acpica/evgpeblk.c
> @@ -303,12 +303,8 @@ acpi_ev_create_gpe_info_blocks(struct acpi_gpe_block_info *gpe_block)
>  	return_ACPI_STATUS(AE_OK);
> 
>        error_exit:
> -	if (gpe_register_info) {
> -		ACPI_FREE(gpe_register_info);
> -	}
> -	if (gpe_event_info) {
> -		ACPI_FREE(gpe_event_info);
> -	}
> +	ACPI_FREE(gpe_register_info);
> +	ACPI_FREE(gpe_event_info);
> 
>  	return_ACPI_STATUS(status);
>  }
> diff --git a/drivers/acpi/acpica/evrgnini.c b/drivers/acpi/acpica/evrgnini.c
> index 8354c4f..26b54c2 100644
> --- a/drivers/acpi/acpica/evrgnini.c
> +++ b/drivers/acpi/acpica/evrgnini.c
> @@ -193,9 +193,7 @@ acpi_ev_pci_config_region_setup(acpi_handle handle,
> 
>  	*region_context = NULL;
>  	if (function = ACPI_REGION_DEACTIVATE) {
> -		if (pci_id) {
> -			ACPI_FREE(pci_id);
> -		}
> +		ACPI_FREE(pci_id);
>  		return_ACPI_STATUS(status);
>  	}
> 
> diff --git a/drivers/acpi/acpica/evxfgpe.c b/drivers/acpi/acpica/evxfgpe.c
> index 7662f1a..271e530 100644
> --- a/drivers/acpi/acpica/evxfgpe.c
> +++ b/drivers/acpi/acpica/evxfgpe.c
> @@ -304,9 +304,7 @@ unlock_and_exit:
> 
>  	/* Delete the notify object if it was not used above */
> 
> -	if (new_notify) {
> -		ACPI_FREE(new_notify);
> -	}
> +	ACPI_FREE(new_notify);
>  	return_ACPI_STATUS(status);
>  }
>  ACPI_EXPORT_SYMBOL(acpi_setup_gpe_for_wake)
> diff --git a/drivers/acpi/acpica/exfldio.c b/drivers/acpi/acpica/exfldio.c
> index 7e0afe7..a29e4b6 100644
> --- a/drivers/acpi/acpica/exfldio.c
> +++ b/drivers/acpi/acpica/exfldio.c
> @@ -1005,8 +1005,6 @@ acpi_ex_insert_into_field(union acpi_operand_object *obj_desc,
>        exit:
>  	/* Free temporary buffer if we used one */
> 
> -	if (new_buffer) {
> -		ACPI_FREE(new_buffer);
> -	}
> +	ACPI_FREE(new_buffer);
>  	return_ACPI_STATUS(status);
>  }
> diff --git a/drivers/acpi/acpica/exnames.c b/drivers/acpi/acpica/exnames.c
> index 14689de..4357121 100644
> --- a/drivers/acpi/acpica/exnames.c
> +++ b/drivers/acpi/acpica/exnames.c
> @@ -422,9 +422,7 @@ acpi_ex_get_name_string(acpi_object_type data_type,
>  	}
> 
>  	if (ACPI_FAILURE(status)) {
> -		if (name_string) {
> -			ACPI_FREE(name_string);
> -		}
> +		ACPI_FREE(name_string);
>  		return_ACPI_STATUS(status);
>  	}
> 
> diff --git a/drivers/acpi/acpica/nsxfname.c b/drivers/acpi/acpica/nsxfname.c
> index f3a4d95..24fb89b 100644
> --- a/drivers/acpi/acpica/nsxfname.c
> +++ b/drivers/acpi/acpica/nsxfname.c
> @@ -490,18 +490,10 @@ acpi_get_object_info(acpi_handle handle,
>  	status = AE_OK;
> 
>        cleanup:
> -	if (hid) {
> -		ACPI_FREE(hid);
> -	}
> -	if (uid) {
> -		ACPI_FREE(uid);
> -	}
> -	if (sub) {
> -		ACPI_FREE(sub);
> -	}
> -	if (cid_list) {
> -		ACPI_FREE(cid_list);
> -	}
> +	ACPI_FREE(hid);
> +	ACPI_FREE(uid);
> +	ACPI_FREE(sub);
> +	ACPI_FREE(cid_list);
>  	return (status);
>  }
> 
> diff --git a/drivers/acpi/acpica/uterror.c b/drivers/acpi/acpica/uterror.c
> index 154fdca..0f97110 100644
> --- a/drivers/acpi/acpica/uterror.c
> +++ b/drivers/acpi/acpica/uterror.c
> @@ -228,9 +228,7 @@ acpi_ut_namespace_error(const char *module_name,
>  			acpi_os_printf("[COULD NOT EXTERNALIZE NAME]");
>  		}
> 
> -		if (name) {
> -			ACPI_FREE(name);
> -		}
> +		ACPI_FREE(name);
>  	}
> 
>  	acpi_os_printf(" Namespace lookup failure, %s",
> --
> 1.7.1

