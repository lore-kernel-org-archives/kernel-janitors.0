From: walter harms <wharms@bfs.de>
Date: Tue, 27 Mar 2012 07:31:45 +0000
Subject: Re: [patch] mISDN: array underflow in open_bchannel()
Message-Id: <4F716CE1.3040903@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120327072048.GC19008@elgon.mountain>
In-Reply-To: <20120327072048.GC19008@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.03.2012 09:20, schrieb Dan Carpenter:
> There are two channels here.  User space starts counting channels at one
> but in the kernel we start at zero.  If the user passes in a zero
> channel that's invalid and could lead to memory corruption.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/isdn/hardware/mISDN/hfcpci.c b/drivers/isdn/hardware/mISDN/hfcpci.c
> index d055ae7..e2c83a2 100644
> --- a/drivers/isdn/hardware/mISDN/hfcpci.c
> +++ b/drivers/isdn/hardware/mISDN/hfcpci.c
> @@ -1962,7 +1962,7 @@ open_bchannel(struct hfc_pci *hc, struct channel_req *rq)
>  {
>  	struct bchannel		*bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/w6692.c b/drivers/isdn/hardware/mISDN/w6692.c
> index 7f1e7ba..2183357 100644
> --- a/drivers/isdn/hardware/mISDN/w6692.c
> +++ b/drivers/isdn/hardware/mISDN/w6692.c
> @@ -1015,7 +1015,7 @@ open_bchannel(struct w6692_hw *card, struct channel_req *rq)
>  {
>  	struct bchannel *bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/mISDNisar.c b/drivers/isdn/hardware/mISDN/mISDNisar.c
> index 10446ab..9a6da6e 100644
> --- a/drivers/isdn/hardware/mISDN/mISDNisar.c
> +++ b/drivers/isdn/hardware/mISDN/mISDNisar.c
> @@ -1670,7 +1670,7 @@ isar_open(struct isar_hw *isar, struct channel_req *rq)
>  {
>  	struct bchannel		*bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/netjet.c b/drivers/isdn/hardware/mISDN/netjet.c
> index dd6de9f..c726e09 100644
> --- a/drivers/isdn/hardware/mISDN/netjet.c
> +++ b/drivers/isdn/hardware/mISDN/netjet.c
> @@ -860,7 +860,7 @@ open_bchannel(struct tiger_hw *card, struct channel_req *rq)
>  {
>  	struct bchannel *bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/avmfritz.c b/drivers/isdn/hardware/mISDN/avmfritz.c
> index 05ed4d0c..c0b8c96 100644
> --- a/drivers/isdn/hardware/mISDN/avmfritz.c
> +++ b/drivers/isdn/hardware/mISDN/avmfritz.c
> @@ -891,7 +891,7 @@ open_bchannel(struct fritzcard *fc, struct channel_req *rq)
>  {
>  	struct bchannel		*bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/hfcsusb.c b/drivers/isdn/hardware/mISDN/hfcsusb.c
> index 6023387..8cde2a0 100644
> --- a/drivers/isdn/hardware/mISDN/hfcsusb.c
> +++ b/drivers/isdn/hardware/mISDN/hfcsusb.c
> @@ -486,7 +486,7 @@ open_bchannel(struct hfcsusb *hw, struct channel_req *rq)
>  {
>  	struct bchannel		*bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;
> diff --git a/drivers/isdn/hardware/mISDN/mISDNipac.c b/drivers/isdn/hardware/mISDN/mISDNipac.c
> index b47e9be..884369f 100644
> --- a/drivers/isdn/hardware/mISDN/mISDNipac.c
> +++ b/drivers/isdn/hardware/mISDN/mISDNipac.c
> @@ -1506,7 +1506,7 @@ open_bchannel(struct ipac_hw *ipac, struct channel_req *rq)
>  {
>  	struct bchannel		*bch;
>  
> -	if (rq->adr.channel > 2)
> +	if (rq->adr.channel = 0 || rq->adr.channel > 2)
>  		return -EINVAL;
>  	if (rq->protocol = ISDN_P_NONE)
>  		return -EINVAL;


hi dan,
short question: is is possible to make rq->adr.channel unsigned ?

re,
 wh

