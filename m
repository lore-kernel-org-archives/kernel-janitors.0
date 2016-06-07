From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Date: Tue, 07 Jun 2016 12:16:01 +0000
Subject: RE: [patch -next] qed: potential overflow in qed_cxt_src_t2_alloc()
Message-Id: <CO2PR11MB00884D3E0A999631A0E6E447975D0@CO2PR11MB0088.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160607120416.GA2175@mwanda>
In-Reply-To: <20160607120416.GA2175@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, Dept-Eng Everest Linux L2 <everest-linux-l2@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> In the current code "ent_per_page" could be more than "conn_num" making
> "conn_num" negative after the subtraction.  In the next iteration through the
> loop then the negative is treated as a very high positive meaning we don't put a
> limit on "ent_num".  It could lead to memory corruption.
> 
> Fixes: dbb799c39717 ('qed: Initialize hardware for new protocols')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I don't think we can actually hit an issue here, since the number of iterations
was also calculated based on conn_num, so this can only happen on the last
iteration.

Regardless, yours is the correct way to go. Thanks, Yuval.

Acked-by: Yuval Mintz <Yuval.Mintz@qlogic.com>
