From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 03 May 2017 17:47:31 +0000
Subject: Re: [PATCH 2/9] pinctrl: Combine two seq_puts() calls into one call in two functions
Message-Id: <CAHp75Vf1_qMZG98CuXBMD64f401AsRqO30TNKbf4Kcsako39tQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <64ab3ba9-6cfa-fd59-976c-8f22b2b9a2c5@users.sourceforge.net>
In-Reply-To: <64ab3ba9-6cfa-fd59-976c-8f22b2b9a2c5@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 12:22 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 May 2017 22:42:13 +0200
>
> Some text was put into a sequence by two separate function calls.
> Print the same data by a single function call instead.

I don't see a benefit here, sorry.
This is slow path in any case (printing is slow). Currently code is
neat, you do it slightly harder to parse.


-- 
With Best Regards,
Andy Shevchenko
