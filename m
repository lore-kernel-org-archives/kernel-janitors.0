From: Dan Streetman <ddstreet@ieee.org>
Date: Tue, 30 May 2017 23:19:33 +0000
Subject: Re: [PATCH 2/3] zswap: Improve a size determination in zswap_frontswap_init()
Message-Id: <CALZtOND7iFpCHQJPGpH21p+N5dcHiVM29ij=DTvJC33U9176=w@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <05101843-91f6-3243-18ea-acac8e8ef6af@users.sourceforge.net> <19f9da22-092b-f867-bdf6-f4dbad7ccf1f@users.sourceforge.net>
In-Reply-To: <19f9da22-092b-f867-bdf6-f4dbad7ccf1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux-MM <linux-mm@kvack.org>, Seth Jennings <sjenning@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sun, May 21, 2017 at 4:26 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 20 May 2017 22:44:03 +0200
>
> Replace the specification of a data structure by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Acked-by: Dan Streetman <ddstreet@ieee.org>

> ---
>  mm/zswap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/zswap.c b/mm/zswap.c
> index 18d8e87119a6..a6e67633be03 100644
> --- a/mm/zswap.c
> +++ b/mm/zswap.c
> @@ -1156,5 +1156,5 @@ static void zswap_frontswap_init(unsigned type)
>  {
>         struct zswap_tree *tree;
>
> -       tree = kzalloc(sizeof(struct zswap_tree), GFP_KERNEL);
> +       tree = kzalloc(sizeof(*tree), GFP_KERNEL);
>         if (!tree) {
> --
> 2.13.0
>
