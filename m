From: Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Wed, 03 Feb 2021 23:24:25 +0000
Subject: Re: [PATCH][next] net: hns3: remove redundant null check of an array
Message-Id: <20210203152425.00007a51@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210203131040.21656-1-colin.king@canonical.com>
In-Reply-To: <20210203131040.21656-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Guangbin Huang <huangguangbin2@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The null check of filp->f_path.dentry->d_iname is redundant because
> it is an array of DNAME_INLINE_LEN chars and cannot be a null. Fix
> this by removing the null check.
> 
> Addresses-Coverity: ("Array compared against 0")
> Fixes: 04987ca1b9b6 ("net: hns3: add debugfs support for tm nodes, priority and qset info")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
