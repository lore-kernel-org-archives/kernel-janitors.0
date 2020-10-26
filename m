From: Yunsheng Lin <linyunsheng@huawei.com>
Date: Mon, 26 Oct 2020 03:18:16 +0000
Subject: Re: [PATCH net] net: hns3: clean up a return in hclge_tm_bp_setup()
Message-Id: <3fbcbfbd-deea-162e-9281-29e65b90996b@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112212.GA282278@mwanda>
In-Reply-To: <20201023112212.GA282278@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Yisen Zhuang <yisen.zhuang@huawei.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Yonglong Liu <liuyonglong@huawei.com>, Yufeng Mo <moyufeng@huawei.com>, Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Guangbin Huang <huangguangbin2@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2020/10/23 19:22, Dan Carpenter wrote:
> Smatch complains that "ret" might be uninitialized if we don't enter
> the loop.  We do always enter the loop so it's a false positive, but
> it's cleaner to just return a literal zero and that silences the
> warning as well.

Thanks for the clean up. Minor comment below:
Perhap it makes sense to limit ret scope within the for loop after
returning zero.

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> index 15f69fa86323..e8495f58a1a8 100644
> --- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> +++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_tm.c
> @@ -1373,7 +1373,7 @@ static int hclge_tm_bp_setup(struct hclge_dev *hdev)
>  			return ret;
>  	}
>  
> -	return ret;
> +	return 0;
>  }
>  
>  int hclge_pause_setup_hw(struct hclge_dev *hdev, bool init)
> 
