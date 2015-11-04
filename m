From: Yuval Mintz <Yuval.Mintz@qlogic.com>
Date: Wed, 04 Nov 2015 13:31:51 +0000
Subject: RE: [patch -next] qlogic/qed: remove bogus NULL check
Message-Id: <B5657A6538887040AD3A81F1008BEC63E68723@avmb3.qlogic.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151104132716.GD20966@mwanda>
In-Reply-To: <20151104132716.GD20966@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ariel Elior <Ariel.Elior@qlogic.com>, Dept-Eng Everest Linux L2 <everest-linux-l2@qlogic.com>, netdev <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> We check if "p_hwfn" is NULL and then dereference it in the error handling
> code.  I read the code and it isn't NULL so let's remove the check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Our current interrupt handling logic is being uber-defensive. Thanks.

Acked-by: Yuval Mintz <Yuval.Mintz@qlogic.com>


