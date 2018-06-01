From: David Miller <davem@davemloft.net>
Date: Fri, 01 Jun 2018 02:50:50 +0000
Subject: Re: [PATCH net-next] virtio_net: fix error return code in virtnet_probe()
Message-Id: <20180531.225050.158410894134322151.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1527732307-145609-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1527732307-145609-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: mst@redhat.com, jasowang@redhat.com, sridhar.samudrala@intel.com, virtualization@lists.linux-foundation.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 31 May 2018 02:05:07 +0000

> Fix to return a negative error code from the failover create fail error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: ba5e4426e80e ("virtio_net: Extend virtio to use VF datapath when available")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied.
