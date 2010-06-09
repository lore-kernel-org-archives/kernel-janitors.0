From: Tejun Heo <tj@kernel.org>
Date: Wed, 09 Jun 2010 12:24:08 +0000
Subject: Re: [patch] sata_sil24: memset() overflow
Message-Id: <4C0F87E8.8020405@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100609120153.GF5483@bicker>
In-Reply-To: <20100609120153.GF5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Jeff Garzik <jgarzik@pobox.com>, Robert Hancock <hancockrwd@gmail.com>, Vivek Mahajan <vivek.mahajan@freescale.com>, linux-ide@vger.kernel.orglinu

On 06/09/2010 02:01 PM, Dan Carpenter wrote:
> cb->atapi.cdb is an array of 16 u8 elements.  The call too memset() 
> would set the first part of the sge array to zero as well.  It's not
> a packed struct. 
> 
> This one has been around for five years.  I found it with Smatch.  I
> think the reason no one has seen it before is because we normally call
> sil24_fill_sg() and that overwrites sge with proper information?

Yeah, the table is built after the memset so it doesn't really break
anything but still where did that 32 come from?  :-)

> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
