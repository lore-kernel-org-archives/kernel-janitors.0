From: Christoph Hellwig <hch@lst.de>
Date: Tue, 25 Aug 2020 07:10:24 +0000
Subject: Re: [PATCH] nvmet-fc: Fix a missed _irqsave version of spin_lock in 'nvmet_fc_fod_op_done()'
Message-Id: <20200825071024.GE29268@lst.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200821075819.152474-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200821075819.152474-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: sagi@grimberg.me, chaitanya.kulkarni@wdc.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, james.smart@broadcom.com, hch@lst.de

On Fri, Aug 21, 2020 at 09:58:19AM +0200, Christophe JAILLET wrote:
> The way 'spin_lock()' and 'spin_lock_irqsave()' are used is not consistent
> in this function.
> 
> Use 'spin_lock_irqsave()' also here, as there is no guarantee that
> interruptions are disabled at that point, according to surrounding code.
> 
> Fixes: a97ec51b37ef ("nvmet_fc: Rework target side abort handling")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Not tested, only based on what looks logical to me according to
> surrounding code

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
