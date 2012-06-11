From: David Miller <davem@davemloft.net>
Date: Mon, 11 Jun 2012 23:43:16 +0000
Subject: Re: [PATCH 1/7] drivers/ide/ide-cs.c: adjust suspicious bit operation
Message-Id: <20120611.164316.2252454788889367611.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1339018901-28439-2-git-send-email-Julia.Lawall@lip6.fr>
	<20120607.144616.2224976714259476349.davem@davemloft.net>
	<alpine.DEB.2.02.1206080712510.1793@hadrien>
In-Reply-To: <alpine.DEB.2.02.1206080712510.1793@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: julia.lawall@lip6.fr
Cc: kernel-janitors@vger.kernel.org, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, joe@perches.com

From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 8 Jun 2012 07:14:03 +0200 (CEST)

> @@ -167,7 +167,8 @@ static int pcmcia_check_one_config(struct
> pcmcia_device *pdev, void *priv_data)

Patch mangled by your email client or similar.
