From: Jakub Kicinski <kuba@kernel.org>
Date: Fri, 08 May 2020 19:38:22 +0000
Subject: Re: [PATCH net-next v2] net: ethernet: ti: fix some return value check of cpsw_ale_create()
Message-Id: <20200508123822.5324b74f@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200508021059.172001-1-weiyongjun1@huawei.com>
        <20200508100649.1112-1-weiyongjun1@huawei.com>
        <da50aa53-a967-83b7-0737-701ab30228e4@ti.com>
In-Reply-To: <da50aa53-a967-83b7-0737-701ab30228e4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, "David S . Miller" <davem@davemloft.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Fri, 8 May 2020 14:26:27 +0300 Grygorii Strashko wrote:
> On 08/05/2020 13:06, Wei Yongjun wrote:
> > cpsw_ale_create() can return both NULL and PTR_ERR(), but all of
> > the caller only check NULL for error handling. This patch convert
> > it to only return PTR_ERR() in all error cases, all the caller using
> > IS_ERR() install of NULL test.
> > 
> > Also fix a return negative error code from the cpsw_ale_create()
> > error handling case instead of 0 in am65_cpsw_nuss_probe().
> > 
> > Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
> > Fixes: 4b41d3436796 ("net: ethernet: ti: cpsw: allow untagged traffic on host port")  
> 
> ^ I do not think it can be back-ported so far back.
> So, or drop second "Fixes: 4b41d3436796"
> or split am65-cpsw-nuss.c changes

Please also tag this commit with [net] not [net-next], 
AFAICS the problem is present in Linus's tree.
