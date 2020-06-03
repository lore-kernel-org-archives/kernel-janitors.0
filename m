From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 03 Jun 2020 22:01:19 +0000
Subject: Re: [PATCH] dmaengine: stm32-mdma: call pm_runtime_put if pm_runtime_get_sync fails
Message-Id: <CAMuHMdU3wMT_pnh4NE9W9Su6qip_oObgd6OiRCwfuvouqjXKHA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
In-Reply-To: <873bfb31-52d8-7c9b-5480-4a94dc945307@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, dmaengine <dmaengine@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com, Alexandre Torgue <alexandre.torgue@st.com>, Dan Williams <dan.j.williams@intel.com>, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <smccaman@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Vinod Koul <vkoul@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi Markus,

Thanks for your comment!

On Wed, Jun 3, 2020 at 8:53 PM Markus Elfring <Markus.Elfring@web.de> wrote:
> > Calling pm_runtime_get_sync increments the counter even in case of
> > failure, causing incorrect ref count. Call pm_runtime_put if
> > pm_runtime_get_sync fails.
>
> Is it appropriate to copy a sentence from the change description
> into the patch subject?
>
> How do you think about a wording variant like the following?
>
>    The PM runtime reference counter is generally incremented by a call of
>    the function “pm_runtime_get_sync”.
>    Thus call the function “pm_runtime_put” also in two error cases
>    to keep the reference counting consistent.

IMHO the important part is "even in case of failure", which you dropped.
Missing that point was the root cause of the issue being fixed.
Hence I prefer the original description, FWIW.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
