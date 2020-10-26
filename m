From: Jakub Kicinski <kuba@kernel.org>
Date: Mon, 26 Oct 2020 23:17:44 +0000
Subject: Re: [PATCH net] net: hns3: clean up a return in hclge_tm_bp_setup()
Message-Id: <20201026161744.4235569d@kicinski-fedora-PC1C0HJN.hsd1.ca.comcast.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112212.GA282278@mwanda>
In-Reply-To: <20201023112212.GA282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, Huazhong Tan <tanhuazhong@huawei.com>, Yonglong Liu <liuyonglong@huawei.com>, Yufeng Mo <moyufeng@huawei.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Guangbin Huang <huangguangbin2@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 23 Oct 2020 14:22:12 +0300 Dan Carpenter wrote:
> Smatch complains that "ret" might be uninitialized if we don't enter
> the loop.  We do always enter the loop so it's a false positive, but
> it's cleaner to just return a literal zero and that silences the
> warning as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!
