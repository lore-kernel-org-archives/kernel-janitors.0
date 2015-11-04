From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Date: Wed, 04 Nov 2015 13:35:15 +0000
Subject: RE: [patch -next] qlogic: qed: fix a test for MODE_MF_SI
Message-Id: <B5657A6538887040AD3A81F1008BEC63E6873E@avmb3.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132911.GE20966@mwanda>
In-Reply-To: <20151104132911.GE20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, Dept-Eng Everest Linux L2 <everest-linux-l2@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> MODE_MF_SI is 9.  We should be testing bit 9 instead of AND 0x9.
> 
> Fixes: fe56b9e6a8d9 ('qed: Add module with basic common support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

True indeed. Thanks.
Acked-by: Yuval Mintz <Yuval.Mintz@qlogic.com>
