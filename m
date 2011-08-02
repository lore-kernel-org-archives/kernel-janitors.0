From: Jonas Bonn <jonas@southpole.se>
Date: Tue, 02 Aug 2011 13:55:44 +0000
Subject: Re: [PATCH 10/11] arch/openrisc/mm/init.c: trivial: use BUG_ON
Message-Id: <1312293344.4723.157.camel@crucifix>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-1-git-send-email-julia@diku.dk>
	 <1312281304-11847-11-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-11-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: trivial@kernel.org, kernel-janitors@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux@openrisc.net, linux-kernel@vger.kernel.org


On Tue, 2011-08-02 at 12:35 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use BUG_ON(x) rather than if(x) BUG();
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ identifier x; @@
> -if (x) BUG();
> +BUG_ON(x);
> 
> @@ identifier x; @@
> -if (!x) BUG();
> +BUG_ON(!x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 

Will apply.  Thanks.

Best regards,
Jonas


