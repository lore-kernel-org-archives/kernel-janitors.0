From: Stefan Schmidt <stefan@datenfreihafen.org>
Date: Tue, 13 Aug 2019 23:28:02 +0000
Subject: Re: [PATCH] net: ieee802154: remove redundant assignment to rc
Message-Id: <a3262e25-209d-209d-59fc-a09511fb9280@datenfreihafen.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813142818.15022-1-colin.king@canonical.com>
In-Reply-To: <20190813142818.15022-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexander Aring <alex.aring@gmail.com>, "David S . Miller" <davem@davemloft.net>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello.

On 13.08.19 16:28, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable rc is initialized to a value that is never read and it is
> re-assigned later. The initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  net/ieee802154/socket.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/net/ieee802154/socket.c b/net/ieee802154/socket.c
> index dacbd58e1799..badc5cfe4dc6 100644
> --- a/net/ieee802154/socket.c
> +++ b/net/ieee802154/socket.c
> @@ -1092,7 +1092,7 @@ static struct packet_type ieee802154_packet_type = {
>  
>  static int __init af_ieee802154_init(void)
>  {
> -	int rc = -EINVAL;
> +	int rc;
>  
>  	rc = proto_register(&ieee802154_raw_prot, 1);
>  	if (rc)
> 


This patch has been applied to the wpan tree and will be
part of the next pull request to net. Thanks!

regards
Stefan Schmidt
