From: David Miller <davem@davemloft.net>
Date: Tue, 30 Dec 2014 23:35:16 +0000
Subject: Re: [PATCH 3/27] atl1e: Use setup_timer
Message-Id: <20141230.183516.405271899216450265.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
	<1419604558-29743-5-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-5-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia.Lawall@lip6.fr
Cc: jcliburn@gmail.com, kernel-janitors@vger.kernel.org, chris.snook@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 26 Dec 2014 15:35:35 +0100

> Convert a call to init_timer and accompanying intializations of
> the timer's data and function fields to a call to setup_timer.
> 
> A simplified version of the semantic match that fixes this problem is as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression t,f,d;
> @@
> 
> -init_timer(&t);
> +setup_timer(&t,f,d);
> -t.function = f;
> -t.data = d;
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Applied.
