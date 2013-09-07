From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 07 Sep 2013 22:53:45 +0000
Subject: Re: [PATCH] ACPICIA: kfree() NULL pointer cleanup
Message-Id: <20130907225345.GW6329@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1378566444-15908-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1378566444-15908-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 07, 2013 at 05:07:24PM +0200, Bojan Prtvar wrote:
> Checking for NULL pointers before kfree() is redundant.
>        error_exit:
> -	if (gpe_register_info) {
> -		ACPI_FREE(gpe_register_info);
> -	}
> -	if (gpe_event_info) {
> -		ACPI_FREE(gpe_event_info);
> -	}
> +	ACPI_FREE(gpe_register_info);
> +	ACPI_FREE(gpe_event_info);

This isn't right.  If you have certain debugging turned on then
ACPI_FREE() does not accept NULL pointers.

regards,
dan carpenter

