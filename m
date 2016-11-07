From: Olof Johansson <olof@lixom.net>
Date: Mon, 07 Nov 2016 21:16:33 +0000
Subject: Re: [PATCH] ARM: spear: Fix error handling
Message-Id: <20161107211633.GA2106@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161029135839.6388-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161029135839.6388-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, Oct 29, 2016 at 03:58:39PM +0200, Christophe JAILLET wrote:
> 'clk_get_sys()' returns an error pointer in case of error, not NULL. So
> test it with IS_ERR.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied to fixes-non-critical, thanks.


-Olof

