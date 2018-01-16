From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 16 Jan 2018 23:19:31 +0000
Subject: Re: [PATCH][next] gpiolib: remove redundant initialization of pointer desc
Message-Id: <CACRpkdboW19udLX3++e0OCw=tfTKEuasb8Jv3a4AZueJxjhUhg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180116115611.24962-1-colin.king@canonical.com>
In-Reply-To: <20180116115611.24962-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 16, 2018 at 12:56 PM, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> The initialized value stored in pointer desc is never read as it
> is updated in the first executable statement in the function.
> This is therefore redundant and can be removed.
>
> Cleans up clang warning:
> drivers/gpio/gpiolib.c:3710:20: warning: Value stored to 'desc'
> during its initialization is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied.

Yours,
Linus Walleij
