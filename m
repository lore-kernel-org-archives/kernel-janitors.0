From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 17 Jan 2018 15:32:36 +0000
Subject: Re: [PATCH net-next] devlink: Make some functions static
Message-Id: <20180117153236.GF2114@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516159662-109725-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516159662-109725-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Jiri Pirko <jiri@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Wed, Jan 17, 2018 at 04:27:42AM CET, weiyongjun1@huawei.com wrote:
>Fixes the following sparse warnings:
>
>net/core/devlink.c:2297:25: warning:
> symbol 'devlink_resource_find' was not declared. Should it be static?
>net/core/devlink.c:2322:6: warning:
> symbol 'devlink_resource_validate_children' was not declared. Should it be static?
>
>Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
