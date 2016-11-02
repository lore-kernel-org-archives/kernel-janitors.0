From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Wed, 02 Nov 2016 02:37:53 +0000
Subject: Re: [PATCH] ARM: spear: Fix error handling
Message-Id: <CAOh2x=kiECTSiSk0+R63gDbm8_NM6wDm=03RJKEyznnHfOZuDg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161029135839.6388-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161029135839.6388-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Sat, Oct 29, 2016 at 7:28 PM, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
> 'clk_get_sys()' returns an error pointer in case of error, not NULL. So
> test it with IS_ERR.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  arch/arm/mach-spear/time.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
