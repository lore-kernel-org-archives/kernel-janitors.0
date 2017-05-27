From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 May 2017 19:08:02 +0000
Subject: Re: [PATCH 0/6] PNP: Adjustments for four function implementations
Message-Id: <CAHp75VcX3JfU2X_Q3Y0embLbtFri+xnTOrJ40zQC9PSQU9OZwA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
In-Reply-To: <94f6ec12-0092-e1e6-3fb1-81f9630eae1f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, May 15, 2017 at 10:10 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 15 May 2017 21:03:21 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.

You need to fold these 6 in to two:
PNP: Improve a size determination
PNP: Delete an error message for a failed memory allocation

And effectively after I'm not sure the first one even needed for now.

>
> Markus Elfring (6):
>   Delete an error message for a failed memory allocation in pnp_alloc()
>   Improve a size determination in pnp_alloc_dev()
>   Improve a size determination in pnp_clone_dependent_set()
>   Delete an error message for a failed memory allocation in pnp_clone_dependent_set()
>   Improve a size determination in quirk_awe32_add_ports()
>   Delete an error message for a failed memory allocation in quirk_awe32_add_ports()
>
>  drivers/pnp/core.c   |  6 ++----
>  drivers/pnp/quirks.c | 15 ++++-----------
>  2 files changed, 6 insertions(+), 15 deletions(-)
>
> --
> 2.13.0
>



-- 
With Best Regards,
Andy Shevchenko
