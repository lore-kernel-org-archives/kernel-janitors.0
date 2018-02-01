From: Shrikrishna Khare <skhare@shri-linux.eng.vmware.com>
Date: Thu, 01 Feb 2018 19:28:52 +0000
Subject: Re: [PATCH] vmxnet3: remove redundant initialization of pointer 'rq'
Message-Id: <alpine.DEB.2.10.1802011125140.23969@shri-linux.eng.vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180201172921.22770-1-colin.king@canonical.com>
In-Reply-To: <20180201172921.22770-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Shrikrishna Khare <skhare@vmware.com>, pv-drivers@vmware.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Thu, 1 Feb 2018, Colin King wrote:

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

Acked-by: Shrikrishna Khare <skhare@vmware.com>
