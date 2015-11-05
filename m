From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Date: Thu, 05 Nov 2015 09:01:08 +0000
Subject: RE: [patch -next] qlogic: qed: fix error codes in qed_resc_alloc()
Message-Id: <B5657A6538887040AD3A81F1008BEC63E6BC48@avmb3.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151105084128.GC19405@mwanda>
In-Reply-To: <20151105084128.GC19405@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, Dept-Eng Everest Linux L2 <everest-linux-l2@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> We accidentally return success instead of -ENOMEM here.
> 
> Fixes: fe56b9e6a8d9 ('qed: Add module with basic common support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>

Thanks. Although you might also argue that it's good enough for this function
to always return -ENOMEM [given it's a resource allocation functions]
instead of bothering with setting 'rc' with correct error codes.

Regardless,
Acked-by: Yuval Mintz <Yuval.Mintz@qlogic.com
