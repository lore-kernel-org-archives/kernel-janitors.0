From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Oct 2020 06:52:36 +0000
Subject: Re: [PATCH net] net: hns3: clean up a return in hclge_tm_bp_setup()
Message-Id: <20201026065235.GG18329@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112212.GA282278@mwanda>
 <3fbcbfbd-deea-162e-9281-29e65b90996b@huawei.com>
In-Reply-To: <3fbcbfbd-deea-162e-9281-29e65b90996b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Yonglong Liu <liuyonglong@huawei.com>, Yufeng Mo <moyufeng@huawei.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Guangbin Huang <huangguangbin2@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 26, 2020 at 11:18:16AM +0800, Yunsheng Lin wrote:
> On 2020/10/23 19:22, Dan Carpenter wrote:
> > Smatch complains that "ret" might be uninitialized if we don't enter
> > the loop.  We do always enter the loop so it's a false positive, but
> > it's cleaner to just return a literal zero and that silences the
> > warning as well.
> 
> Thanks for the clean up. Minor comment below:
> Perhap it makes sense to limit ret scope within the for loop after
> returning zero.
> 

It's not really normal to limit ret scope...  I think it's better to
leave it as-is.

regards,
dan carpenter
