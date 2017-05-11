From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:29:58 +0000
Subject: Re: [PATCH 9/9] pinctrl: Adjust nine checks for null pointers
Message-Id: <CACRpkdZhZomAuJ-4Ohiqj2sm-F5z7gjuLR9ETQii9+PAsCHm_g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <9294b4fd-f4f1-9540-973b-08c0cfee04c8@users.sourceforge.net>
In-Reply-To: <9294b4fd-f4f1-9540-973b-08c0cfee04c8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:29 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 11:04:55 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> The script “checkpatch.pl” pointed information out like the following.
>
> Comparison to NULL could be written …
>
> Thus fix the affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
