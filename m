From: David Miller <davem@davemloft.net>
Date: Thu, 21 Nov 2019 19:42:31 +0000
Subject: Re: [PATCH net-next] octeontx2-af: Fix uninitialized variable in debugfs
Message-Id: <20191121.114231.144140953957043920.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191121092146.hnvdwnzpirskw3wr@kili.mountain>
In-Reply-To: <20191121092146.hnvdwnzpirskw3wr@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: sgoutham@marvell.com, lcherian@marvell.com, gakula@marvell.com, jerinj@marvell.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 21 Nov 2019 12:21:46 +0300

> If rvu_get_blkaddr() fails, then this rvu_cgx_nix_cuml_stats() returns
> zero and we write some uninitialized data into the debugfs output.
> 
> On the error paths, the use of the uninitialized "*stat" is harmless,
> but it will lead to a Smatch warning (static analysis) and a UBSan
> warning (runtime analysis) so we should prevent that as well.
> 
> Fixes: f967488d095e ("octeontx2-af: Add per CGX port level NIX Rx/Tx counters")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
