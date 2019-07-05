From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 05 Jul 2019 19:06:51 +0000
Subject: Re: [PATCH] xtensa: One function call less in bootmem_init()
Message-Id: <CAMo8BfK_VuL4-xtmY+jYDmrJ-t9a-AyPNCxS7-Db4HzAqpr_BA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <495c9f2e-7880-ee9a-5c61-eee598bb24c2@web.de>
In-Reply-To: <495c9f2e-7880-ee9a-5c61-eee598bb24c2@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Zankel <chris@zankel.net>, Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

On Fri, Jul 5, 2019 at 9:43 AM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 18:33:58 +0200
>
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement for a setting selection.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/xtensa/mm/init.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Thanks for the patch. It doesn't change generated code since
PHYS_OFFSET is a build-time constant, but it's a nice cleanup.
Applied to my xtensa tree.

-- 
Thanks.
-- Max
