From: Jiri Pirko <jiri@resnulli.us>
Date: Fri, 19 Oct 2018 12:12:24 +0000
Subject: Re: [PATCH net-next] rocker: Drop pointless static qualifier
Message-Id: <20181019121224.GG4558@nanopsycho.orion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539950579-182423-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539950579-182423-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fri, Oct 19, 2018 at 02:02:59PM CEST, yuehaibing@huawei.com wrote:
>There is no need to have the 'struct rocker_desc_info *desc_info'
>variable static since new value always be assigned before use it.
>
>Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
