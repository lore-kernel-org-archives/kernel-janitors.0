From: Jiri Pirko <jiri@resnulli.us>
Date: Wed, 17 Jan 2018 15:35:44 +0000
Subject: Re: [PATCH][devlink-next] devlink: make functions a couple of new functions static
Message-Id: <20180117153544.GG2114@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180117112303.20149-1-colin.king@canonical.com>
In-Reply-To: <20180117112303.20149-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jiri Pirko <jiri@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Wed, Jan 17, 2018 at 12:23:03PM CET, colin.king@canonical.com wrote:
>From: Colin Ian King <colin.king@canonical.com>
>
>The functions devlink_resource_find and devlink_resource_validate_children
>are local to the source and do not need to be in global scope, so make
>them static.
>
>Cleans up sparse warnings:
>symbol 'devlink_resource_find' was not declared. Should it be static?
>warning: symbol 'devlink_resource_validate_children' was not declared.
>Should it be static?
>
>Signed-off-by: Colin Ian King <colin.king@canonical.com>

This is already submitted here:
http://patchwork.ozlabs.org/patch/862020/
