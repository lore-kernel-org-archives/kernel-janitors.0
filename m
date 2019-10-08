From: "Maciej W. Rozycki" <macro@linux-mips.org>
Date: Tue, 08 Oct 2019 08:29:58 +0000
Subject: Re: [PATCH][next] netdevsim: fix spelling mistake "forbidded" -> "forbid"
Message-Id: <alpine.LFD.2.21.1910080921350.25653@eddie.linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191008081747.19431-1-colin.king@canonical.com>
In-Reply-To: <20191008081747.19431-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jakub Kicinski <jakub.kicinski@netronome.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 8 Oct 2019, Colin King wrote:

> diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
> index a3d7d39f231a..ff6ced5487b6 100644
> --- a/drivers/net/netdevsim/dev.c
> +++ b/drivers/net/netdevsim/dev.c
> @@ -486,7 +486,7 @@ static int nsim_dev_reload_down(struct devlink *devlink, bool netns_change,
>  		/* For testing purposes, user set debugfs dont_allow_reload
>  		 * value to true. So forbid it.
>  		 */
> -		NL_SET_ERR_MSG_MOD(extack, "User forbidded reload for testing purposes");
> +		NL_SET_ERR_MSG_MOD(extack, "User forbid the reload for testing purposes");

 If nitpicking about grammar, then FWIW I believe it should actually be:

		NL_SET_ERR_MSG_MOD(extack, "User forbade the reload for testing purposes");

(and then:

		NL_SET_ERR_MSG_MOD(extack, "User set up the reload to fail for testing purposes");

elsewhere).

  Maciej
