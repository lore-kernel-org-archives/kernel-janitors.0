From: David Miller <davem@davemloft.net>
Date: Wed, 14 Jun 2017 19:20:29 +0000
Subject: Re: [PATCH net-next] qed: Fix an off by one bug
Message-Id: <20170614.152029.1673534481673725513.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170614091009.GA29394@elgon.mountain>
In-Reply-To: <20170614091009.GA29394@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: Yuval.Mintz@cavium.com, Ariel.Elior@cavium.com, everest-linux-l2@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 12:10:10 +0300

> The p_l2_info->pp_qid_usage[] array has "p_l2_info->queues" elements so
> the > here should be a >= or we write beyond the end of the array.
> 
> Fixes: bbe3f233ec5e ("qed: Assign a unique per-queue index to queue-cid")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
