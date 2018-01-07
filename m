From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 07 Jan 2018 22:58:05 +0000
Subject: Re: [PATCH] atm/clip: Use seq_puts() in svc_addr()
Message-Id: <CAHp75Vf-fNi-ATKd-EpkO3HDP2TZCWFc6EEU5a5r-zkZTcHQYg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
In-Reply-To: <97636808-1d9f-d196-ebce-fbd2505c50e2@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: netdev <netdev@vger.kernel.org>, Bhumika Goyal <bhumirks@gmail.com>, "David S. Miller" <davem@davemloft.net>, David Windsor <dwindsor@gmail.com>, Elena Reshetova <elena.reshetova@intel.com>, Hans Liljestrand <ishkamiel@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Kees Cook <keescook@chromium.org>, Roopa Prabhu <roopa@cumulusnetworks.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Sat, Jan 6, 2018 at 11:44 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jan 2018 22:34:12 +0100
>
> Two strings should be quickly put into a sequence by two function calls.
> Thus use the function "seq_puts" instead of "seq_printf".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  net/atm/clip.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/net/atm/clip.c b/net/atm/clip.c
> index d4f6029d5109..62a852165b19 100644
> --- a/net/atm/clip.c
> +++ b/net/atm/clip.c
> @@ -708,11 +708,11 @@ static void svc_addr(struct seq_file *seq, struct sockaddr_atmsvc *addr)
>         static int e164[] = { 1, 8, 4, 6, 1, 0 };
>
>         if (*addr->sas_addr.pub) {
> -               seq_printf(seq, "%s", addr->sas_addr.pub);
> +               seq_puts(seq, addr->sas_addr.pub);

Which opens a lot of security concerns.
Never do this again.

>                 if (*addr->sas_addr.prv)
>                         seq_putc(seq, '+');
>         } else if (!*addr->sas_addr.prv) {

> -               seq_printf(seq, "%s", "(none)");
> +               seq_puts(seq, "(none)");

...while this one is okay per se, better to keep above pattern (same
style over the piece of code / function).

>                 return;
>         }
>         if (*addr->sas_addr.prv) {
> --
> 2.15.1
>

P.S. I'm wondering what would be first, Markus starts looking into the
actual code, or most (all) of the maintainers just ban him.

-- 
With Best Regards,
Andy Shevchenko
