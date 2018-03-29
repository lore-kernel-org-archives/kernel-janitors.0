From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Thu, 29 Mar 2018 01:56:37 +0000
Subject: Re: [PATCH] staging: vt6655: check for memory allocation failures
Message-Id: <20180329015637.GA9416@ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180328063144epcas1p305216b582520b884b09c93a7ad591660@epcas1p3.samsung.com>
 <1522218691-7917-1-git-send-email-ji_hun.kim@samsung.com>
 <fc4cd041-f8b4-f799-916d-9df790efbba7@gmail.com>
In-Reply-To: <fc4cd041-f8b4-f799-916d-9df790efbba7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: baijiaju1990@gmail.com, gregkh@linuxfoundation.org, forest@alittletooquiet.net
Cc: devel@driverdev.osuosl.org, y.k.oh@samsung.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, santhameena13@gmail.com

On Wed, Mar 28, 2018 at 05:55:57PM +0800, Jia-Ju Bai wrote:
> >@@ -646,7 +649,8 @@ static void device_init_td1_ring(struct vnt_private *priv)
> >  	     i++, curr += sizeof(struct vnt_tx_desc)) {
> >  		desc = &priv->apTD1Rings[i];
> >  		desc->td_info = kzalloc(sizeof(*desc->td_info), GFP_KERNEL);
> >-
> >+		if (WARN_ON(!desc->td_info))
> >+			return;
> >  		desc->td_info->buf = priv->tx1_bufs + i * PKT_BUF_SZ;
> >  		desc->td_info->buf_dma = priv->tx_bufs_dma1 + i * PKT_BUF_SZ;
> 
> I think the bugs you found are right.
> But your patch is not correct, because it is dangerous to return directly.
> I think you should return an error and then implement error handling
> code for these functions.
> 
Yes, it needs to free previous allocated values in the for loop. Directly
return could make memory leaks. I am going to make patch v2. 

- Delete WARN_ON which could make crashes on some machines.
- Add freeing sequences for previously allocated memory when kzalloc()
  failed instead of returning directly.

Does these changes would be fine on this bug?
