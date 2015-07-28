From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Date: Tue, 28 Jul 2015 18:17:20 +0000
Subject: Re: [patch 1/2] Staging: rtl8192e: array overflow in rtl92e_set_swcam()
Message-Id: <55B7C730.4090301@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150728154821.GA25739@mwanda>
In-Reply-To: <20150728154821.GA25739@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28.07.2015 17:48, Dan Carpenter wrote:
> "EntryNo" is comes from the user in the ioctl and it's a number between
> 0-255.  The ieee->swcamtable[] array only has 32 elements so it can
> result in memory corruption.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index dc8c7a8..c146b7e 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -78,6 +78,10 @@ void rtl92e_set_swcam(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
>  	RT_TRACE(COMP_DBG,
>  		 "======>%s():EntryNo is %d,KeyIndex is %d,KeyType is %d,is_mesh is %d\n",
>  		 __func__, EntryNo, KeyIndex, KeyType, is_mesh);
> +
> +	if (EntryNo >= TOTAL_CAM_ENTRY)
> +		return;
> +
>  	if (!is_mesh) {
>  		ieee->swcamtable[EntryNo].bused = true;
>  		ieee->swcamtable[EntryNo].key_index = KeyIndex;
> 

+1 for both patches - thanks for finding this.
