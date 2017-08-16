From: Kees Cook <keescook@chromium.org>
Date: Wed, 16 Aug 2017 19:33:54 +0000
Subject: Re: [PATCH 2/3] pstore: Improve a size determination in three functions
Message-Id: <CAGXu5jLdTHJB576tqhpPZb_cV0B4zMnSAVkG=DzTN-dT51iAsw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97737d95-d6aa-d24f-1af0-9d4895ceaed2@users.sourceforge.net> <23798ef4-5559-3454-ecf4-e6844b644ff3@users.sourceforge.net>
In-Reply-To: <23798ef4-5559-3454-ecf4-e6844b644ff3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Anton Vorontsov <anton@enomsg.org>, Colin Cross <ccross@android.com>, Tony Luck <tony.luck@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Wed, Aug 16, 2017 at 12:22 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 16 Aug 2017 20:50:15 +0200
>
> Replace the specification of data types by pointer dereferences
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.

Agreed; this is a robustness change in that changes to the variable
structure will be correctly flowed through to the allocations.

>
> This issue was detected by using the Coccinelle software.

Which script detected this?

-Kees

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/pstore/ram.c      | 3 +--
>  fs/pstore/ram_core.c | 4 ++--
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 42d27e5fac9f..0ef95c384bed 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -293,8 +293,7 @@ static ssize_t ramoops_pstore_read(struct pstore_record *record)
>                          */
>                         struct persistent_ram_zone *tmp_prz, *prz_next;
>
> -                       tmp_prz = kzalloc(sizeof(struct persistent_ram_zone),
> -                                         GFP_KERNEL);
> +                       tmp_prz = kzalloc(sizeof(*tmp_prz), GFP_KERNEL);
>                         if (!tmp_prz)
>                                 return -ENOMEM;
>                         free_prz = true;
> diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
> index fafa8af1289c..5d9f7280d757 100644
> --- a/fs/pstore/ram_core.c
> +++ b/fs/pstore/ram_core.c
> @@ -405,7 +405,7 @@ static void *persistent_ram_vmap(phys_addr_t start, size_t size,
>         else
>                 prot = pgprot_writecombine(PAGE_KERNEL);
>
> -       pages = kmalloc_array(page_count, sizeof(struct page *), GFP_KERNEL);
> +       pages = kmalloc_array(page_count, sizeof(*pages), GFP_KERNEL);
>         if (!pages)
>                 return NULL;
>
> @@ -520,7 +520,7 @@ struct persistent_ram_zone *persistent_ram_new(phys_addr_t start, size_t size,
>         struct persistent_ram_zone *prz;
>         int ret = -ENOMEM;
>
> -       prz = kzalloc(sizeof(struct persistent_ram_zone), GFP_KERNEL);
> +       prz = kzalloc(sizeof(*prz), GFP_KERNEL);
>         if (!prz)
>                 goto err;
>
> --
> 2.14.0
>



-- 
Kees Cook
Pixel Security
