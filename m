From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 07 Jan 2015 17:53:57 +0000
Subject: Re: [PATCH 8/27] wireless: cw1200: Use setup_timer
Message-Id: <87fvbmqxxm.fsf@kamboji.qca.qualcomm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1419604558-29743-1-git-send-email-Julia.Lawall@lip6.fr>
	<1419604558-29743-7-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1419604558-29743-7-git-send-email-Julia.Lawall@lip6.fr> (Julia
	Lawall's message of "Fri, 26 Dec 2014 15:35:37 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Solomon Peachy <pizza@shaftnet.org>, kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@lip6.fr> writes:

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
> -t.data = d;
> -t.function = f;
> // </smpl>
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

Thanks, I applied the wireless-drivers patches below to
wireless-drivers-next.git.

e4a1c3f88e65 mwifiex: 11n_rxreorder: Use setup_timer
c6c33e772407 mwifiex: main: Use setup_timer
99a1b74395a5 orinoco_usb: Use setup_timer
1a94ace406ad iwl3945: Use setup_timer
af68b87f7211 iwl4965: Use setup_timer
0be01bf29721 cw1200: queue: Use setup_timer
dabefea6937d cw1200: main: Use setup_timer
983988ec0a24 wireless: cw1200: Use setup_timer

-- 
Kalle Valo
