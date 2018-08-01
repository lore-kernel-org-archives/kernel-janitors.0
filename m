From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Wed, 01 Aug 2018 05:22:08 +0000
Subject: Re: [PATCH net-next] xfrm: Make function xfrmi_get_link_net() static
Message-Id: <20180801052208.wg4ct6kt5g2gdbrr@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1532760588-31129-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1532760588-31129-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Lorenzo Colitti <lorenzo@google.com>, Benedict Wong <benedictwong@google.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jul 28, 2018 at 06:49:48AM +0000, Wei Yongjun wrote:
> Fixes the following sparse warning:
> 
> net/xfrm/xfrm_interface.c:745:12: warning:
>  symbol 'xfrmi_get_link_net' was not declared. Should it be static?
> 
> Fixes: f203b76d7809 ("xfrm: Add virtual xfrm interfaces")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thanks Wei!
