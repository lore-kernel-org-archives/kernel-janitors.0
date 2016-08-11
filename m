From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Thu, 11 Aug 2016 13:39:02 +0000
Subject: Re: [PATCH] ARM: cpuidle: Fix error return code
Message-Id: <20160811133902.GC26202@red-moon>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470920550-21625-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470920550-21625-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: rjw@rjwysocki.net, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Aug 11, 2016 at 03:02:30PM +0200, Christophe JAILLET wrote:
> We know that 'ret = 0' because it has been tested a few lines above.
> So, if 'kzalloc' fails, 0 will be returned instead of an error code.
> Return -ENOMEM instead.
> 
> Fixes: a0d46a3dfdc3 ("ARM: cpuidle: Register per cpuidle device")
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/cpuidle/cpuidle-arm.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
