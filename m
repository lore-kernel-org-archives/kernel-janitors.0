From: Edward Cree <ecree@solarflare.com>
Date: Mon, 27 Jul 2020 12:13:40 +0000
Subject: Re: [PATCH 2/7] sfc: drop unnecessary list_empty
Message-Id: <f8564082-0dad-a1a7-9d2e-198b429b58d4@solarflare.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
 <1595761112-11003-3-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-3-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, Solarflare linux maintainers <linux-net-drivers@solarflare.com>
Cc: kernel-janitors@vger.kernel.org, Martin Habets <mhabets@solarflare.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

On 26/07/2020 11:58, Julia Lawall wrote:
> list_for_each_safe is able to handle an empty list.
> The only effect of avoiding the loop is not initializing the
> index variable.
> Drop list_empty tests in cases where these variables are not
> used.
Sure, why not.
Acked-by: Edward Cree <ecree@solarflare.com>
