From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Fri, 04 Jan 2019 16:10:22 +0000
Subject: Re: [PATCH -next] xen/pvcalls: remove set but not used variable 'intf'
Message-Id: <f90e002d-3808-157d-d8a7-a716c461f74c@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1546581820-123466-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1546581820-123466-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/4/19 1:03 AM, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
>
> drivers/xen/pvcalls-back.c: In function 'pvcalls_sk_state_change':
> drivers/xen/pvcalls-back.c:286:28: warning:
>  variable 'intf' set but not used [-Wunused-but-set-variable]
>
> It not used since e6587cdbd732 ("pvcalls-back: set -ENOTCONN in
> pvcalls_conn_back_read")
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>

and applied to for-linus-4.21.

Thanks.
-boris
