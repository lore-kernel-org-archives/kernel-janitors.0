From: Marcel Holtmann <marcel@holtmann.org>
Date: Sat, 06 Jul 2019 10:51:00 +0000
Subject: Re: [PATCH][next] 6lowpan: fix off-by-one comparison of index id with LOWPAN_IPHC_CTX_TABLE_SIZE
Message-Id: <B6A1CB42-C239-42CA-B14E-483A02B930EB@holtmann.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190624144757.1285-1-colin.king@canonical.com>
In-Reply-To: <20190624144757.1285-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexander Aring <alex.aring@gmail.com>, Jukka Rissanen <jukka.rissanen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, linux-bluetooth@vger.kernel.org, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Colin,

> The WARN_ON_ONCE check on id is off-by-one, it should be greater or equal
> to LOWPAN_IPHC_CTX_TABLE_SIZE and not greater than. Fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> net/6lowpan/debugfs.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/6lowpan/debugfs.c b/net/6lowpan/debugfs.c
> index 1c140af06d52..a510bed8165b 100644
> --- a/net/6lowpan/debugfs.c
> +++ b/net/6lowpan/debugfs.c
> @@ -170,7 +170,7 @@ static void lowpan_dev_debugfs_ctx_init(struct net_device *dev,
> 	struct dentry *root;
> 	char buf[32];
> 
> -	WARN_ON_ONCE(id > LOWPAN_IPHC_CTX_TABLE_SIZE);
> +	WARN_ON_ONCE(id >= LOWPAN_IPHC_CTX_TABLE_SIZE);

this patch no longer applied cleanly to bluetooth-next. Can you send me an updated version.

Regards

Marcel
