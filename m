From: David Miller <davem@davemloft.net>
Date: Thu, 18 Oct 2018 22:59:21 +0000
Subject: Re: [PATCH net-next] bnxt_en: Copy and paste bug in extended tx_stats
Message-Id: <20181018.155921.1255000330618849685.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018080239.z2egoh4bw4beb3r3@kili.mountain>
In-Reply-To: <20181018080239.z2egoh4bw4beb3r3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 18 Oct 2018 11:02:39 +0300

> The struct type was copied from the line before but it should be "tx"
> instead of "rx".  I have reviewed the code and I can't immediately see
> that this bug causes a runtime issue.
> 
> Fixes: 36e53349b60b ("bnxt_en: Add additional extended port statistics.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from static analysis and I don't have a way to test it.

Applied.
