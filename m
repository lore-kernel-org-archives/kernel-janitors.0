From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 27 Sep 2004 23:07:58 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/4] video/pxafb: replace
Message-Id: <20040927230758.GS1617@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43483493362751613=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============43483493362751613==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 27, 2004 at 04:06:20PM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> 
> Description: Use msleep() instead of schedule_timeout() to
> guarantee the task delays as expected.
> 
> --- 2.6.9-rc2-vanilla/drivers/video/pxafb.c	2004-09-13 17:15:38.000000000 -0700
> +++ 2.6.9-rc2/drivers/video/pxafb.c	2004-09-14 10:42:13.000000000 -0700
> @@ -747,7 +747,7 @@ static void pxafb_disable_controller(str
>  	LCCR0 &= ~LCCR0_LDM;	/* Enable LCD Disable Done Interrupt */
>  	LCCR0 |= LCCR0_DIS;	/* Disable LCD Controller */
>  
> -	schedule_timeout(20 * HZ / 1000);
> +	msleep(20);
>  	remove_wait_queue(&fbi->ctrlr_wait, &wait);
>  }

Sorry, this patch should *not* be applied - because the
schedule_timeout(), I believe, is there for the wait queue event, but
msleep() will ignore that event.

-Nish

--===============43483493362751613==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43483493362751613==--
