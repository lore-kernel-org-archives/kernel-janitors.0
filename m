From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 03 Nov 2017 12:00:32 +0000
Subject: Re: [PATCH v2 2/3] Sony-laptop: Delete an unnecessary variable initialisation in sony_nc_setup_rfkil
Message-Id: <CAHp75VeqvKHLiSSdQGYLjBdqdPcFt7gaeKpXpWCtFv93ZaR1sg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
 <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net> <3bc1148d-01e1-11fe-1594-1c7ffd83600f@users.sourceforge.net>
In-Reply-To: <3bc1148d-01e1-11fe-1594-1c7ffd83600f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

On Wed, Nov 1, 2017 at 8:47 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 1 Nov 2017 19:00:59 +0100
>
> The local variable "err" will eventually be set to an appropriate value
> a bit later. Thus omit the explicit initialisation at the beginning.

Applied to my review and testing queue, thanks!

>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/platform/x86/sony-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 4332cc982ce0..62aa2c37b8d2 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1627,7 +1627,7 @@ static const struct rfkill_ops sony_rfkill_ops = {
>  static int sony_nc_setup_rfkill(struct acpi_device *device,
>                                 enum sony_nc_rfkill nc_type)
>  {
> -       int err = 0;
> +       int err;
>         struct rfkill *rfk;
>         enum rfkill_type type;
>         const char *name;
> --
> 2.14.3
>



-- 
With Best Regards,
Andy Shevchenko
