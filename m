From: David Miller <davem@davemloft.net>
Date: Tue, 13 Mar 2018 14:55:01 +0000
Subject: Re: [PATCH net] qed: Use after free in qed_rdma_free()
Message-Id: <20180313.105501.1782065500332609196.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180313090938.GA17609@mwanda>
In-Reply-To: <20180313090938.GA17609@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Ariel.Elior@cavium.com, Michal.Kalderon@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Mar 2018 12:09:38 +0300

> We're dereferencing "p_hwfn->p_rdma_info" but that is freed on the line
> before in qed_rdma_resc_free(p_hwfn).
> 
> Fixes: 9de506a547c0 ("qed: Free RoCE ILT Memory on rmmod qedr")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.
