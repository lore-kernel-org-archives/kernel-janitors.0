From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 02 Apr 2020 12:31:36 +0000
Subject: Re: [PATCH] efi/libstub/x86: remove redundant assignment to pointer hdr
Message-Id: <CAMj1kXF=v5QNEPdzFuwuE6-FTysGV1qTfsHLRFkbgG8sjMcAMQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402102537.503103-1-colin.king@canonical.com>
In-Reply-To: <20200402102537.503103-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-efi <linux-efi@vger.kernel.org>, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, 2 Apr 2020 at 12:25, Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer hdr is being assigned a value that is never read and
> it is being updated later with a new value. The assignment is
> redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks Colin. I'll queue this up.

> ---
>  drivers/firmware/efi/libstub/x86-stub.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/libstub/x86-stub.c b/drivers/firmware/efi/libstub/x86-stub.c
> index 8d3a707789de..e02ea51273ff 100644
> --- a/drivers/firmware/efi/libstub/x86-stub.c
> +++ b/drivers/firmware/efi/libstub/x86-stub.c
> @@ -392,8 +392,6 @@ efi_status_t __efiapi efi_pe_entry(efi_handle_t handle,
>         image_base = efi_table_attr(image, image_base);
>         image_offset = (void *)startup_32 - image_base;
>
> -       hdr = &((struct boot_params *)image_base)->hdr;
> -
>         status = efi_allocate_pages(0x4000, (unsigned long *)&boot_params, ULONG_MAX);
>         if (status != EFI_SUCCESS) {
>                 efi_printk("Failed to allocate lowmem for boot params\n");
> --
> 2.25.1
>
