From: Jiri Pirko <jiri@resnulli.us>
Date: Sun, 23 Sep 2018 17:20:24 +0000
Subject: Re: [PATCH net] devlink: double free in devlink_resource_fill()
Message-Id: <20180923172024.GC2203@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180921080755.GA16307@mwanda>
In-Reply-To: <20180921080755.GA16307@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jiri Pirko <jiri@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fri, Sep 21, 2018 at 10:07:55AM CEST, dan.carpenter@oracle.com wrote:
>Smatch reports that devlink_dpipe_send_and_alloc_skb() frees the skb
>on error so this is a double free.  We fixed a bunch of these bugs in
>commit 7fe4d6dcbcb4 ("devlink: Remove redundant free on error path") but
>we accidentally overlooked this one.
>
>Fixes: d9f9b9a4d05f ("devlink: Add support for resource abstraction")
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
