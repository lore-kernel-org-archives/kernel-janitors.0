From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 Aug 2017 19:32:20 +0000
Subject: Re: [PATCH 1/3] pstore: Delete six error messages for a failed memory allocation
Message-Id: <CAGXu5j+J9+HJumrpyfiSA5_T8OeAEkM_Q4KVY70ka_c2BDgQ3w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net> <b0842266-6f8c-cba6-3cb5-98fc49f10f07@users.sourceforge.net>
In-Reply-To: <b0842266-6f8c-cba6-3cb5-98fc49f10f07@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 16, 2017 at 12:21 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 16 Aug 2017 20:30:44 +0200
>
> Omit extra messages for a memory allocation failure in these functions.

I'm not interested in removing these since they provide additional
details about which specific allocation failed.

> This issue was detected by using the Coccinelle software.

For all these kinds of patches please include details on which
coccinelle script did the detection...

-Kees

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/pstore/ram.c      |  6 +-----
>  fs/pstore/ram_core.c | 15 ++++-----------
>  2 files changed, 5 insertions(+), 16 deletions(-)
>
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 7125b398d312..42d27e5fac9f 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -719,7 +719,6 @@ static int ramoops_probe(struct platform_device *pdev)
>         if (dev_of_node(dev) && !pdata) {
>                 pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
>                 if (!pdata) {
> -                       pr_err("cannot allocate platform data buffer\n");
>                         err = -ENOMEM;
>                         goto fail_out;
>                 }
> @@ -814,7 +813,6 @@ static int ramoops_probe(struct platform_device *pdev)
>         cxt->pstore.bufsize = max(cxt->record_size, cxt->pstore.bufsize);
>         cxt->pstore.buf = kmalloc(cxt->pstore.bufsize, GFP_KERNEL);
>         if (!cxt->pstore.buf) {
> -               pr_err("cannot allocate pstore buffer\n");
>                 err = -ENOMEM;
>                 goto fail_clear;
>         }
> @@ -904,10 +902,8 @@ static void ramoops_register_dummy(void)
>         pr_info("using module parameters\n");
>
>         dummy_data = kzalloc(sizeof(*dummy_data), GFP_KERNEL);
> -       if (!dummy_data) {
> -               pr_info("could not allocate pdata\n");
> +       if (!dummy_data)
>                 return;
> -       }
>
>         dummy_data->mem_size = mem_size;
>         dummy_data->mem_address = mem_address;
> diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
> index e11672aa4575..fafa8af1289c 100644
> --- a/fs/pstore/ram_core.c
> +++ b/fs/pstore/ram_core.c
> @@ -292,10 +292,8 @@ void persistent_ram_save_old(struct persistent_ram_zone *prz)
>         if (!prz->old_log) {
>                 persistent_ram_ecc_old(prz);
>                 prz->old_log = kmalloc(size, GFP_KERNEL);
> -       }
> -       if (!prz->old_log) {
> -               pr_err("failed to allocate buffer\n");
> -               return;
> +               if (!prz->old_log)
> +                       return;
>         }
>
>         prz->old_log_size = size;
> @@ -411,8 +409,5 @@ static void *persistent_ram_vmap(phys_addr_t start, size_t size,
> -       if (!pages) {
> -               pr_err("%s: Failed to allocate array for %u pages\n",
> -                      __func__, page_count);
> +       if (!pages)
>                 return NULL;
> -       }
>
>         for (i = 0; i < page_count; i++) {
>                 phys_addr_t addr = page_start + i * PAGE_SIZE;
> @@ -529,7 +524,5 @@ struct persistent_ram_zone *persistent_ram_new(phys_addr_t start, size_t size,
> -       if (!prz) {
> -               pr_err("failed to allocate persistent ram zone\n");
> +       if (!prz)
>                 goto err;
> -       }
>
>         /* Initialize general buffer state. */
>         raw_spin_lock_init(&prz->buffer_lock);
> --
> 2.14.0
>



-- 
Kees Cook
Pixel Security
