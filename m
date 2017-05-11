From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 13:25:25 +0000
Subject: Re: [PATCH 5/9] pinctrl: Adjust five checks for null pointers
Message-Id: <CACRpkdatAch4Nh_npvdB4stqH6RRKVL3LHoHFhkpoTO5LhokoA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net> <080f6ec0-7796-d802-7b64-8ea9b5488a7a@users.sourceforge.net>
In-Reply-To: <080f6ec0-7796-d802-7b64-8ea9b5488a7a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, May 2, 2017 at 11:25 AM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 2 May 2017 10:01:57 +0200
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
>
> The script “checkpatch.pl” pointed information out like the following.
>
> Comparison to NULL could be written !…
>
> Thus fix the affected source code places.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.

Yours,
Linus Walleij
