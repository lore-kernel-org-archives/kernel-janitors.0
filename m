From: Ji-Hun Kim <ji_hun.kim@samsung.com>
Date: Fri, 30 Mar 2018 03:50:03 +0000
Subject: Re: [PATCH v3] staging: vt6655: check for memory allocation failures
Message-Id: <20180330035003.GA27619@ubuntu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CGME20180330024416epcas2p2f566f43a8f5af8b4ebc17659e3cf0ecf@epcas2p2.samsung.com>
	<1522377844-23591-1-git-send-email-ji_hun.kim@samsung.com>
	<be23acda-38c0-dce3-9c79-8672113f6960@gmail.com>
In-Reply-To: <be23acda-38c0-dce3-9c79-8672113f6960@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Cc: gregkh@linuxfoundation.org, forest@alittletooquiet.net, dartnorris@gmail.com, santhameena13@gmail.com, julia.lawall@lip6.fr, y.k.oh@samsung.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Mar 30, 2018 at 11:15:03AM +0800, Jia-Ju Bai wrote:
> 
> 
> On 2018/3/30 10:44, Ji-Hun Kim wrote:
> >@@ -1165,10 +1205,18 @@ static int vnt_start(struct ieee80211_hw *hw)
> >  	}
> >  	dev_dbg(&priv->pcid->dev, "call device init rd0 ring\n");
> >-	device_init_rd0_ring(priv);
> >-	device_init_rd1_ring(priv);
> >-	device_init_td0_ring(priv);
> >-	device_init_td1_ring(priv);
> >+	ret = device_init_rd0_ring(priv);
> >+	if (ret)
> >+		goto error;
> >+	ret = device_init_rd1_ring(priv);
> >+	if (ret)
> >+		goto error;
> >+	ret = device_init_td0_ring(priv);
> >+	if (ret)
> >+		goto error;
> >+	ret = device_init_td1_ring(priv);
> >+	if (ret)
> >+		goto error;
> >  	device_init_registers(priv);
> >@@ -1178,6 +1226,8 @@ static int vnt_start(struct ieee80211_hw *hw)
> >  	ieee80211_wake_queues(hw);
> >  	return 0;
> >+error:
> >+	return ret;
> >  }
> 
> This code will lead to memory leaks when device_init_rd1_ring()
> fails, because the memory allocated by device_init_rd0_ring() is not
> freed.
> 
> I think this one will be better:
>     ret = device_init_rd0_ring(priv);
>     if (ret)
>         goto error_init_rd0_ring;
>     ret = device_init_rd1_ring(priv);
>     if (ret)
>         goto error_init_rd1_ring;
>     ret = device_init_td0_ring(priv);
>     if (ret)
>         goto error_init_td0_ring;
>     ret = device_init_td1_ring(priv);
>     if (ret)
>         goto error_init_td1_ring;
>     ......
> error_init_td1_ring:
>     device_free_td0_ring(priv);
> error_init_td0_ring:
>     device_free_rd1_ring(priv);
> error_init_rd1_ring:
>     device_free_rd0_ring(priv);
> error_init_rd0_ring:
>     return ret;
> 
> 
> Best wishes,
> Jia-Ju Bai
> 
> 
Oh, sorry, I got what you said. Yes, you are right. I am going to make patch v4. Thanks!

Best regards,
Ji-Hun
