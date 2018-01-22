From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 22 Jan 2018 10:34:12 +0000
Subject: Re: [PATCH][next] devlink: fix memory leak on 'resource'
Message-Id: <20180122103412.GB2012@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180122103119.4801-1-colin.king@canonical.com>
In-Reply-To: <20180122103119.4801-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Arkadi Sharshevsky <arkadis@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Mon, Jan 22, 2018 at 11:31:19AM CET, colin.king@canonical.com wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>Currently, if the call to devlink_resource_find returns null then
>the error exit path does not free the devlink_resource 'resource'
>and a memory leak occurs. Fix this by kfree'ing resource on the
>error exit path.
>
>Detected by CoverityScan, CID#1464184 ("Resource leak")
>
>Fixes: d9f9b9a4d05f ("devlink: Add support for resource abstraction")
>Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>

Thanks.
