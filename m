From: Olof Johansson <olof@lixom.net>
Date: Mon, 07 Nov 2016 21:18:49 +0000
Subject: Re: [PATCH] ARM: zx: Fix error handling
Message-Id: <20161107211849.GB2106@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030081010.14735-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030081010.14735-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sun, Oct 30, 2016 at 09:10:10AM +0100, Christophe JAILLET wrote:
> 'devm_ioremap_resource()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> 'return -EIO;' could also be turned into 'return PTR_ERR(pcubase);' in
> order to propagate the error value.

Applied to fixes-non-critical. Thanks!


-Olof
