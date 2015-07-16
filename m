From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jul 2015 08:22:33 +0000
Subject: Re: [patch v2 2/2] pinctrl: samsung: remove "out of memory" messages
Message-Id: <CACRpkdaKn+vv2Mf=G=YpisokpvQfxGaHMkgA4aGNpL9-zr9Vqg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150619085203.GO28762@mwanda>
	<20150622151315.GB14156@mwanda>
In-Reply-To: <20150622151315.GB14156@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Mon, Jun 22, 2015 at 5:13 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> Checkpatch.pl complains about these:
>
> WARNING: Possible unnecessary 'out of memory' message
>
> The messages use a little extra RAM and they add a few extra lines of
> code.  We're probably never going to hit these out of memory situations
> but if we did then kmalloc() has pretty good error messages built-in.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
