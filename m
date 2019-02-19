From: Andrew Lunn <andrew@lunn.ch>
Date: Tue, 19 Feb 2019 17:46:42 +0000
Subject: Re: [PATCH v3] net: ns83820: code cleanup for ns83820_probe_phy()
Message-Id: <20190219174642.GD13075@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <715767253.151509.1550580124264@ox-groupware.bfs.de>
In-Reply-To: <715767253.151509.1550580124264@ox-groupware.bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Walter Harms <wharms@bfs.de>
Cc: Mao Wenan <maowenan@huawei.com>, kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org, julia.lawall@lip6.fr

> >  	for (i=1; i<2; i++) {
> 
> 
> the loop here seems also pointless, so you can eliminate i.
> (or did i muss something ?)

If you widen out your view a bit, you find all this code is inside a
#ifdef PHY_CODE_IS_FINISHED. I don't see anything which actually
defines that.

So a lot more code could probably be removed.

   Andrew
