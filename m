From: Frans Klaver <fransklaver@gmail.com>
Date: Wed, 01 Jul 2015 14:21:41 +0000
Subject: Re: [PATCH v2 3/3] Staging: android: uapi: Fix coding style typedef issue
Message-Id: <CAH6sp9MjjGct=LjyPoELA-ate6SDdcCaCkGVdnvQcTzSDG12FQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5593EDBF.6010008@zoho.com>
	<5593EF8E.9020002@zoho.com>
In-Reply-To: <5593EF8E.9020002@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, arve@android.com, riandrews@android.com, Sumit Semwal <sumit.semwal@linaro.org>, carlos@cgarcia.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Subject suggestion: "staging: android: uapi: remove unnecessary typedef"

That makes it immediately clear what the issue is.


On Wed, Jul 1, 2015 at 3:47 PM, Sohny Thomas <sohnythomas@zoho.com> wrote:
>
> As per checkpatch.pl remove unnecessary typedef
> Here ion_user_handle_t was used only in the header .
>
> Signed-of-by: Sohny Thomas <sohnythomas@zoho.com>

Typo here as well.


> ---
>  drivers/staging/android/uapi/ion.h | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/android/uapi/ion.h b/drivers/staging/android/uapi/ion.h
> index 68a14b4..9897403 100644
> --- a/drivers/staging/android/uapi/ion.h
> +++ b/drivers/staging/android/uapi/ion.h
> @@ -20,7 +20,6 @@
>  #include <linux/ioctl.h>
>  #include <linux/types.h>
>
> -typedef int ion_user_handle_t;
>

I would expect an extra line to be removed here. This will leave two
empty lines.

>  /**
>   * enum ion_heap_types - list of all possible types of heaps
> @@ -88,7 +87,7 @@ struct ion_allocation_data {
>         size_t align;
>         unsigned int heap_id_mask;
>         unsigned int flags;
> -       ion_user_handle_t handle;
> +       int handle;
>  };
>
>  /**
> @@ -102,7 +101,7 @@ struct ion_allocation_data {
>   * provides the file descriptor and the kernel returns the handle.
>   */
>  struct ion_fd_data {
> -       ion_user_handle_t handle;
> +       int handle;
>         int fd;
>  };
>
> @@ -111,7 +110,7 @@ struct ion_fd_data {
>   * @handle:    a handle
>   */
>  struct ion_handle_data {
> -       ion_user_handle_t handle;
> +       int handle;
>  };
>
>  /**
> --
>
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
