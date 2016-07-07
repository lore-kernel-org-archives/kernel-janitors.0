From: Daniel Lezcano <daniel.lezcano@linaro.org>
Date: Thu, 07 Jul 2016 07:46:50 +0000
Subject: Re: [PATCH] clocksource: cadence_ttc: fix a return value in case of error
Message-Id: <20160707074650.GA13755@linaro.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1467783323-16632-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1467783323-16632-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jul 06, 2016 at 07:35:23AM +0200, Christophe JAILLET wrote:
> IS_ERR and PTR_ERR should use the same variable, clk_ce in this case.
> 
> Fixes: 4de1eb07c47f (Convert init function to return error)
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thanks.

  -- Daniel
