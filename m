From: David Miller <davem@davemloft.net>
Date: Wed, 08 Jun 2016 07:33:36 +0000
Subject: Re: [patch -next] qed: potential overflow in qed_cxt_src_t2_alloc()
Message-Id: <20160608.003336.1269899649820841663.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160607120416.GA2175@mwanda>
In-Reply-To: <20160607120416.GA2175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@qlogic.com, Ariel.Elior@qlogic.com, everest-linux-l2@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jun 2016 15:04:16 +0300

> In the current code "ent_per_page" could be more than "conn_num" making
> "conn_num" negative after the subtraction.  In the next iteration
> through the loop then the negative is treated as a very high positive
> meaning we don't put a limit on "ent_num".  It could lead to memory
> corruption.
> 
> Fixes: dbb799c39717 ('qed: Initialize hardware for new protocols')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
