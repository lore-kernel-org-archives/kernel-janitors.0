From: David Miller <davem@davemloft.net>
Date: Mon, 27 Jul 2020 17:10:21 +0000
Subject: Re: [PATCH 2/7] sfc: drop unnecessary list_empty
Message-Id: <20200727.101021.661505441351232064.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
        <1595761112-11003-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@inria.fr
Cc: linux-net-drivers@solarflare.com, kernel-janitors@vger.kernel.org, ecree@solarflare.com, mhabets@solarflare.com, kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Sun, 26 Jul 2020 12:58:27 +0200

> list_for_each_safe is able to handle an empty list.
> The only effect of avoiding the loop is not initializing the
> index variable.
> Drop list_empty tests in cases where these variables are not
> used.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
 ...
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Applied to net-next.
