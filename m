From: Jiri Pirko <jiri@resnulli.us>
Date: Mon, 04 Jun 2018 14:49:20 +0000
Subject: Re: [PATCH 2/2 net] team: use netdev_features_t instead of u32
Message-Id: <20180604144920.GC2153@nanopsycho>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180604.093147.1707102168081704551.davem@davemloft.net>
 <20180604144601.wo5iqb5irfes4frv@kili.mountain>
In-Reply-To: <20180604144601.wo5iqb5irfes4frv@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Mon, Jun 04, 2018 at 04:46:01PM CEST, dan.carpenter@oracle.com wrote:
>This code was introduced in 2011 around the same time that we made
>netdev_features_t a u64 type.  These days a u32 is not big enough to
>hold all the potential features.
>
>Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jiri Pirko <jiri@mellanox.com>
