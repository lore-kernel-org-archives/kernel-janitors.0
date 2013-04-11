From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 11 Apr 2013 19:40:57 +0000
Subject: Re: [patch 1/2 -next] dma-buf: double unlock in debugfs code
Message-Id: <20130411194057.GA7193@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130411062339.GA7603@elgon.mountain>
In-Reply-To: <20130411062339.GA7603@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, Dave Airlie <airlied@redhat.com>, linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

On Thu, Apr 11, 2013 at 09:23:39AM +0300, Dan Carpenter wrote:
> We unlock here when we failed to take the lock.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is in linux-next, and I think the debugfs code is only in Sumit's
> tree.

Yes, it's not in mine, so I can't take this, sorry.  Sumit, please apply
this:

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
