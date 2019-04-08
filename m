From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 08 Apr 2019 11:07:09 +0000
Subject: Re: [PATCH] pinctrl: imx: remove an unnecessary NULL check
Message-Id: <CACRpkdbu2S9gx4Vs3R6cMvGK2M+5-qzMXJYeWcw7MFf-LP3c5g@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190328144022.GO32613@kadam>
In-Reply-To: <20190328144022.GO32613@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Mar 28, 2019 at 3:40 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The address of "ipctl->pin_regs[pin_id]" can't be NULL.  It's the offset
> into an array in the middle of a struct.  This patch removes the check.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Dong's ACK!

Yours,
Linus Walleij
