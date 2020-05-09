From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 05:23:15 +0000
Subject: Re: [PATCH net-next] octeontx2-vf: Fix error return code in otx2vf_probe()
Message-Id: <20200508222315.3b672eeb@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508021519.179062-1-weiyongjun1@huawei.com>
In-Reply-To: <20200508021519.179062-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Tomasz Duszynski <tduszynski@marvell.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Fri, 8 May 2020 02:15:19 +0000 Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the alloc failed error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 3184fb5ba96e ("octeontx2-vf: Virtual function driver support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you!
