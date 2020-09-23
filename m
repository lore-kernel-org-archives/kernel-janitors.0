From: Jens Axboe <axboe@kernel.dk>
Date: Wed, 23 Sep 2020 15:18:28 +0000
Subject: Re: [PATCH 06/14] block: drop double zeroing
Message-Id: <b71efcfb-4ffd-d125-0ef7-ed5ab6b03892@kernel.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1600601186-7420-1-git-send-email-Julia.Lawall@inria.fr>
 <1600601186-7420-7-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1600601186-7420-7-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, linux-block@vger.kernel.org, linux-kernel@vger.kernel.org

On 9/20/20 5:26 AM, Julia Lawall wrote:
> sg_init_table zeroes its first argument, so the allocation of that argument
> doesn't have to.
> 
> the semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression x;
> @@
> 
> x > - kzalloc
> + kmalloc
>  (...)
> ...
> sg_init_table(x,...)
> // </smpl>

Applied for 5.10, thanks.

-- 
Jens Axboe
