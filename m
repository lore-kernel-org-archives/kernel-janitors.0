From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Nov 2013 08:07:36 +0000
Subject: Re: [patch] mfd: ab8500-debugfs: move dereference after check for NULL
Message-Id: <CACRpkdZ3GbUCkK3mte3wM_WCmtuvOvCYfu2PkJSy+7yhx_qpqQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131113074030.GA25541@elgon.mountain>
In-Reply-To: <20131113074030.GA25541@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Nov 13, 2013 at 8:40 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> We dereference "desc" before check if it is NULL.  I've shifted it
> around so we check first before dereferencing.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I am not able to compile this.

Looks and compiles good.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Lee are you queueing this?

Yours,
Linus Walleij
