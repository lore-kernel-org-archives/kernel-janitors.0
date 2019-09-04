From: Cornelia Huck <cohuck@redhat.com>
Date: Wed, 04 Sep 2019 08:31:00 +0000
Subject: Re: [PATCH -next] vfio-ccw: fix error return code in vfio_ccw_sch_init()
Message-Id: <20190904103100.4a53d035.cohuck@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904083315.105600-1-weiyongjun1@huawei.com>
In-Reply-To: <20190904083315.105600-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Sebastian Ott <sebott@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, linux-s390@vger.kernel.org, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 4 Sep 2019 08:33:15 +0000
Wei Yongjun <weiyongjun1@huawei.com> wrote:

> Fix to return negative error code -ENOMEM from the memory alloc failed
> error handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 60e05d1cf087 ("vfio-ccw: add some logging")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/s390/cio/vfio_ccw_drv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)

Ah, yes.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

Heiko/Vasily/Christian: can you queue this directly?
