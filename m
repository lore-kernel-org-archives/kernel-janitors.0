From: Juergen Gross <jgross@suse.com>
Date: Mon, 03 Dec 2018 06:45:27 +0000
Subject: Re: [PATCH -next] xen/pvcalls: remove set but not used variable 'bedata'
Message-Id: <91ea5a9e-a644-d535-066c-529ba23ba978@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1543630209-135108-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1543630209-135108-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 01/12/2018 03:10, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/xen/pvcalls-front.c: In function 'pvcalls_front_sendmsg':
> drivers/xen/pvcalls-front.c:506:25: warning:
>  variable 'bedata' set but not used [-Wunused-but-set-variable]
> 
> drivers/xen/pvcalls-front.c: In function 'pvcalls_front_recvmsg':
> drivers/xen/pvcalls-front.c:603:25: warning:
>  variable 'bedata' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
