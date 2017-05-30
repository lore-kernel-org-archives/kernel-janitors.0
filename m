From: Dan Streetman <ddstreet@ieee.org>
Date: Tue, 30 May 2017 23:20:00 +0000
Subject: Re: [PATCH 3/3] zswap: Delete an error message for a failed memory allocation in zswap_dstmem_prepar
Message-Id: <CALZtONA5gyeqioF=F4BWpJ8T8-kc-BNsuas0gK4555GS-GkApQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net> <bae25b04-2ce2-7137-a71c-50d7b4f06431@users.sourceforge.net>
In-Reply-To: <bae25b04-2ce2-7137-a71c-50d7b4f06431@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MM <linux-mm@kvack.org>, Seth Jennings <sjenning@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, May 21, 2017 at 4:27 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 21 May 2017 09:29:25 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> This issue was detected by using the Coccinelle software.
>
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Dan Streetman <ddstreet@ieee.org>

> ---
>  mm/zswap.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 3f0a9a1daef4..ed7312291df9 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -374,7 +374,6 @@ static int zswap_dstmem_prepare(unsigned int cpu)
> -       if (!dst) {
> -               pr_err("can't allocate compressor buffer\n");
> +       if (!dst)
>                 return -ENOMEM;
> -       }
> +
>         per_cpu(zswap_dstmem, cpu) = dst;
>         return 0;
>  }
> --
> 2.13.0
>
