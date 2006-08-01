From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 01 Aug 2006 01:55:50 +0000
Subject: Re: [KJ] [PATCH] Use standard min/max macros [3/3]
Message-Id: <20060801015550.GA7006@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060731221329.GA31140@diwi.org>
In-Reply-To: <20060731221329.GA31140@diwi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Tue, Aug 01, 2006 at 12:26:01AM +0200, Cl=E9ment Stenac wrote:
> Remove some custom type-unsafe MIN/MAX macros in favor of type-checking
> min/max from kernel.h

> --- a/drivers/acpi/executer/exfldio.c
> +++ b/drivers/acpi/executer/exfldio.c
> @@ -752,7 +752,7 @@ acpi_ex_extract_from_field(union acpi_op
>  		/* Write merged datum to target buffer */
> =20
>  		ACPI_MEMCPY(((char *)buffer) + buffer_offset, &merged_datum,
> -			    ACPI_MIN(obj_desc->common_field.access_byte_width,
> +			         min(obj_desc->common_field.access_byte_width,
>  				     buffer_length - buffer_offset));
> =20
>  		buffer_offset +=3D obj_desc->common_field.access_byte_width;
> @@ -771,7 +771,7 @@ acpi_ex_extract_from_field(union acpi_op
>  	/* Write the last datum to the buffer */
> =20
>  	ACPI_MEMCPY(((char *)buffer) + buffer_offset, &merged_datum,
> -		    ACPI_MIN(obj_desc->common_field.access_byte_width,
> +		         min(obj_desc->common_field.access_byte_width,
>  			     buffer_length - buffer_offset));
> =20
>  	return_ACPI_STATUS(AE_OK);
> @@ -850,7 +850,7 @@ acpi_ex_insert_into_field(union acpi_ope
>  	/* Get initial Datum from the input buffer */
> =20
>  	ACPI_MEMCPY(&raw_datum, buffer,
> -		    ACPI_MIN(obj_desc->common_field.access_byte_width,
> +		         min(obj_desc->common_field.access_byte_width,
>  			     buffer_length - buffer_offset));
> =20
>  	merged_datum > @@ -903,7 +903,7 @@ acpi_ex_insert_into_field(union acpi=
_ope
> =20
>  		buffer_offset +=3D obj_desc->common_field.access_byte_width;
>  		ACPI_MEMCPY(&raw_datum, ((char *)buffer) + buffer_offset,
> -			    ACPI_MIN(obj_desc->common_field.access_byte_width,
> +			         min(obj_desc->common_field.access_byte_width,
>  				     buffer_length - buffer_offset));
>  		merged_datum |>  		    raw_datum << obj_desc->common_field.start_field=
_bit_offset;

ACPI wants to keep code shared between multiple OSms so save this part
for better day. :-(

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
