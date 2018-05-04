From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 04 May 2018 16:08:09 +0000
Subject: Re: [patch] gpiolib: fix gpiochip_machine_hog()
Message-Id: <CACRpkdbpxUNmKE46e-BMrgCt0opy23tRBjmEHak-2d1ODm-4uA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180501073638.GA6126@mwanda>
In-Reply-To: <20180501073638.GA6126@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 1, 2018 at 9:36 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a shifter vs vanilla mask bug here.  We want to test if 1 << 11
> is set but we're testing if 0xb is set.
>
> Fixes: 9a6c505f7df1 ("gpiolib: add hogs support for machine code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Bartosz review tag.

Yours,
Linus Walleij
