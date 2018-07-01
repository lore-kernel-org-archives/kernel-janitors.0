From: Joe Perches <joe@perches.com>
Date: Sun, 01 Jul 2018 18:26:32 +0000
Subject: Re: [PATCH 0/3] cast sizeof to int for comparison
Message-Id: <653914f26dc8433a3f682b5e7eb850ab94bd431d.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530466325-1678-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1530466325-1678-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-usb@vger.kernel.org, Chengguang Xu <cgxu519@gmx.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, linux-media@vger.kernel.org

On Sun, 2018-07-01 at 19:32 +0200, Julia Lawall wrote:
> Comparing an int to a size, which is unsigned, causes the int to become
> unsigned, giving the wrong result.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Great, thanks.

But what about the ones in net/smc like:

> net/smc/smc_clc.c:	
> 
>         len = kernel_sendmsg(smc->clcsock, &msg, &vec, 1,
>                              sizeof(struct smc_clc_msg_decline));
>         if (len < sizeof(struct smc_clc_msg_decline))

Are those detected by the semantic match and ignored?
