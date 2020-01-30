From: David Miller <davem@davemloft.net>
Date: Thu, 30 Jan 2020 10:03:49 +0000
Subject: Re: [PATCH] ide: make drive->dn read only
Message-Id: <20200130.110349.1758084246617103502.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <89d856ef-7c00-a2b7-bfcc-483c78092d20@samsung.com>
        <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
In-Reply-To: <20200121125942.hkr3zg77i5gtgc7v@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: b.zolnierkie@samsung.com, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jan 2020 16:06:42 +0300

> The IDE core always sets ->dn correctly so changing it is never
> required.
> 
> Setting it to a different value than assigned by IDE core is very likely
> to result in data corruption (due to wrong transfer timings being set on
> the controller etc.)
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
