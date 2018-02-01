From: David Miller <davem@davemloft.net>
Date: Thu, 01 Feb 2018 19:54:56 +0000
Subject: Re: [PATCH] vmxnet3: remove redundant initialization of pointer 'rq'
Message-Id: <20180201.145456.251900509374837057.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180201172921.22770-1-colin.king@canonical.com>
In-Reply-To: <20180201172921.22770-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: skhare@vmware.com, pv-drivers@vmware.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  1 Feb 2018 17:29:21 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer rq is being initialized but this value is never read, it
> is being updated inside a for-loop. Remove the initialization and
> move it into the scope of the for-loop.
> 
> Cleans up clang warning:
> drivers/net/vmxnet3/vmxnet3_drv.c:2763:27: warning: Value stored
> to 'rq' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
