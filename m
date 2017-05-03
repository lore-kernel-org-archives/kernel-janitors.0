From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 03 May 2017 17:48:17 +0000
Subject: Re: [PATCH 3/9] pinctrl: Combine five seq_printf() calls into one call in pinconf_dbg_config_print()
Message-Id: <CAHp75Vdrz91SD=xxBZS9_3kL3XPeVbgyaZpYy52TUixcYHx3vw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <fe725663-d873-b8e4-f364-9abec47ba17e@users.sourceforge.net>
In-Reply-To: <fe725663-d873-b8e4-f364-9abec47ba17e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 12:23 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 22:52:29 +0200
>
> Some data were put into a sequence by five separate function calls.
> Print the same data by a single function call instead.

> -               seq_printf(s, "No config found for dev/state/pin, expected:\n");
> -               seq_printf(s, "Searched dev:%s\n", dbg->dev_name);
> -               seq_printf(s, "Searched state:%s\n", dbg->state_name);
> -               seq_printf(s, "Searched pin:%s\n", dbg->pin_name);
> -               seq_printf(s, "Use: modify config_pin <devname> "\
> -                               "<state> <pinname> <value>\n");
> +               seq_printf(s,
> +                          "No config found for dev/state/pin, expected:\n"
> +                          "Searched dev:%s\n"
> +                          "Searched state:%s\n"
> +                          "Searched pin:%s\n"
> +                          "Use: modify config_pin <devname> <state> <pinname> <value>\n",
> +                          dbg->dev_name,
> +                          dbg->state_name,
> +                          dbg->pin_name);

Please, no.

-- 
With Best Regards,
Andy Shevchenko
