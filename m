From: David Miller <davem@davemloft.net>
Date: Fri, 31 May 2019 21:37:11 +0000
Subject: Re: [PATCH] xen-netback: remove redundant assignment to err
Message-Id: <20190531.143711.1406359688787927167.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190530190438.9571-1-colin.king@canonical.com>
In-Reply-To: <20190530190438.9571-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: wei.liu2@citrix.com, paul.durrant@citrix.com, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 30 May 2019 20:04:38 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable err is assigned with the value -ENOMEM that is never
> read and it is re-assigned a new value later on.  The assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
