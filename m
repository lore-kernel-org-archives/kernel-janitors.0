From: David Miller <davem@davemloft.net>
Date: Sat, 08 Apr 2017 15:14:59 +0000
Subject: Re: [PATCH][-next] nfp: don't dereference a null nn->eth_port to print a warning
Message-Id: <20170408.081459.254155739436767702.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170406125435.18898-1-colin.king@canonical.com>
In-Reply-To: <20170406125435.18898-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: jakub.kicinski@netronome.com, simon.horman@netronome.com, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  6 Apr 2017 13:54:35 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> On the case where nn->eth_port is null the warning message
> is printing the port by dereferencing this null pointer.
> Remove the deference to avoid a crash when printing the
> warning message.
> 
> Detected by CoverityScan, CID#1426198 ("Dereference after null check")
> 
> Fixes: ce22f5a2cbe3c627 ("nfp: separate high level and low level NSP headers")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
