From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Mon, 08 Apr 2019 06:49:44 +0000
Subject: Re: [PATCH -next] gpio: mlxbf: remove unused including <linux/version.h>
Message-Id: <CAMpxmJVjgpSEo5WPvC0hXJtE2AoP7D=-A58vFe5yeRcFfekmqA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328013958.33849-1-yuehaibing@huawei.com>
In-Reply-To: <20190328013958.33849-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

pt., 5 kwi 2019 o 12:58 Linus Walleij <linus.walleij@linaro.org> napisa=C5=
=82(a):
>
> On Thu, Mar 28, 2019 at 8:28 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> > Remove including <linux/version.h> that don't need it.
> >
> > Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
> I put this on hold so Bartosz can apply it to his patch stack
> where the dependent patches are queued.
>
> Yours,
> Linus Walleij

Patch applied. I'll send a pull-request later today so we can sync our
for-next trees.

Bart
