From: Mike Rapoport <rppt@linux.ibm.com>
Date: Tue, 04 Dec 2018 07:47:58 +0000
Subject: Re: [PATCH 1/3] mm: add include files so that function definitions have a prototype
Message-Id: <20181204074757.GF26700@rapoport-lnx>
List-Id: <kernel-janitors.vger.kernel.org>
References: <466ad4ebe5d788e7be6a14fbbcaaa9596bac7141.1543899764.git.dato@net.com.org.es>
In-Reply-To: <466ad4ebe5d788e7be6a14fbbcaaa9596bac7141.1543899764.git.dato@net.com.org.es>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Adeodato =?iso-8859-1?Q?Sim=F3?= <dato@net.com.org.es>
Cc: linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Tue, Dec 04, 2018 at 02:14:22AM -0300, Adeodato Sim=F3 wrote:
> Previously, rodata_test(), usercopy_warn(), and usercopy_abort() were
> defined without a matching prototype. Detected by -Wmissing-prototypes
> GCC flag.
>=20
> Signed-off-by: Adeodato Sim=F3 <dato@net.com.org.es>

Reviewed-by: Mike Rapoport <rppt@linux.ibm.com>

> ---
> I started poking at this after kernel-janitors got the suggestion[1]
> to look into the -Wmissing-prototypes warnings.
>=20
> Thanks for considering!
>=20
> [1]: https://www.spinics.net/lists/linux-kernel-janitors/msg43981.html
>=20
>  mm/rodata_test.c | 1 +
>  mm/usercopy.c    | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/mm/rodata_test.c b/mm/rodata_test.c
> index d908c8769b48..01306defbd1b 100644
> --- a/mm/rodata_test.c
> +++ b/mm/rodata_test.c
> @@ -11,6 +11,7 @@
>   */
>  #define pr_fmt(fmt) "rodata_test: " fmt
>=20
> +#include <linux/rodata_test.h>
>  #include <linux/uaccess.h>
>  #include <asm/sections.h>
>=20
> diff --git a/mm/usercopy.c b/mm/usercopy.c
> index 852eb4e53f06..f487ba4888df 100644
> --- a/mm/usercopy.c
> +++ b/mm/usercopy.c
> @@ -20,6 +20,7 @@
>  #include <linux/sched/task.h>
>  #include <linux/sched/task_stack.h>
>  #include <linux/thread_info.h>
> +#include <linux/uaccess.h>
>  #include <linux/atomic.h>
>  #include <linux/jump_label.h>
>  #include <asm/sections.h>
> --=20
> 2.19.2
>=20

--=20
Sincerely yours,
Mike.
