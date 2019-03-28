From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Mar 2019 16:14:06 +0000
Subject: Re: [PATCH] i2c: nomadik: remove an unnecessary NULL check in nmk_i2c_remove()
Message-Id: <CACRpkdbauPgF-XS5aKNGnZ=48gHhaczJiNobKuvDZFJqSZ=1XQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328141609.GL32590@kadam>
In-Reply-To: <20190328141609.GL32590@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 28, 2019 at 3:16 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> "res" can't be NULL because it's a pointer to somewhere in the middle of
> the "adev" struct.  Also probe() succeeded so there is no need to check
> here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
