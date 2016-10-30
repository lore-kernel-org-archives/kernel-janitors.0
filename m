From: Jens Axboe <axboe@fb.com>
Date: Sun, 30 Oct 2016 15:02:45 +0000
Subject: Re: [PATCH] nbd: Fix error handling
Message-Id: <b1473dfa-2cb2-5cb6-762d-92a7967d0a6e@fb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161030042827.10160-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161030042827.10160-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, mpa@pengutronix.de, jbacik@fb.com
Cc: nbd-general@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 10/29/2016 10:28 PM, Christophe JAILLET wrote:
> 'blk_mq_alloc_request()' returns an error pointer in case of error, not
> NULL. So test it with IS_ERR.
>
> Fixes: 	fd8383fd88a2 ("nbd: convert to blkmq")

Applied, thanks.

-- 
Jens Axboe

