From: Jakub Kicinski <kuba@kernel.org>
Date: Sat, 09 May 2020 01:42:36 +0000
Subject: Re: [PATCH net-next] nfp: abm: fix error return code in nfp_abm_vnic_alloc()
Message-Id: <20200508184236.6229f2b7@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508072735.61047-1-weiyongjun1@huawei.com>
In-Reply-To: <20200508072735.61047-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Qiushi Wu <wu000273@umn.edu>, Jakub Kicinski <jakub.kicinski@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Fri, 8 May 2020 07:27:35 +0000 Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the kzalloc() error
> handling case instead of 0, as done elsewhere in this function.
> 
> Fixes: 174ab544e3bc ("nfp: abm: add cls_u32 offload for simple band classification")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks!
