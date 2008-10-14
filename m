From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Tue, 14 Oct 2008 19:35:04 +0000
Subject: Re: [PATCH] : Fix compilation warnings in net/802/fc.c
Message-Id: <20081014193500.GA6502@joi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30810141121w58e25b43x92d71ca800c5c96@mail.gmail.com>
In-Reply-To: <ea11fea30810141121w58e25b43x92d71ca800c5c96@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manish Katiyar <mkatiyar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On Tue, Oct 14, 2008 at 11:51:24PM +0530, Manish Katiyar wrote:
> [ I was not sure about which list is this appropriate, so putting
> kernel-janitors since this is cleanup]
Cc'ing netdev@vger

> 
> Below patch fixes the following warning during compilation.
> net/802/fc.c:85: warning: unused variable 'fch'
> 
> Signed-off-by: Manish Katiyar <mkatiyar@gmail.com>
> 
> ---
>  net/802/fc.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/net/802/fc.c b/net/802/fc.c
> index cb3475e..7463109 100644
> --- a/net/802/fc.c
> +++ b/net/802/fc.c
> @@ -82,7 +82,9 @@ static int fc_header(struct sk_buff *skb, struct
> net_device *dev,
> 
>  static int fc_rebuild_header(struct sk_buff *skb)
>  {
> +#ifdef CONFIG_INET
>  	struct fch_hdr *fch=(struct fch_hdr *)skb->data;
> +#endif
>  	struct fcllc *fcllc=(struct fcllc *)(skb->data+sizeof(struct fch_hdr));
>  	if(fcllc->ethertype != htons(ETH_P_IP)) {
>  		printk("fc_rebuild_header: Don't know how to resolve type %04X
> addresses ?\n", ntohs(fcllc->ethertype));
> -- 

When !CONFIG_INET this function always returns 0 (and does not anything useful)
so it probably can be written as:

#ifdef CONFIG_INET
static int fc_rebuild_header(struct sk_buff *skb)
{
...
}
#else
static int fc_rebuild_header(struct sk_buff *skb)
{
	return 0;
}
#endif

Marcin
