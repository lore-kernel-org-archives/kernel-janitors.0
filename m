From: Stelian Pop <stelian@popies.net>
Date: Wed, 19 Jan 2005 13:46:23 +0000
Subject: [KJ] Re: [PATCH 10/21] char/sonypi: replace schedule_timeout() with
Message-Id: <20050119134622.GI3592@crusoe.alcove-fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45570505453744992=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45570505453744992==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 17, 2005 at 02:48:55PM -0800, Nishanth Aravamudan wrote:

> Hi,
> 
> Please consider applying. 
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. In many cases, drivers sleep on a number of jiffies (1 in
> this case), which varies in real time units (milliseconds, for instance) with
> HZ's value. Using msleep() prevents this variance. I have assumed in this patch
> that the old value of HZ (100) was assumed, hence schedule_timeout(1) would
> delay for 10 msecs (equivalent therefore to msleep(10)).
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> --- 2.6.11-rc1-kj-v/drivers/char/sonypi.c	2005-01-15 16:55:41.000000000 -0800
> +++ 2.6.11-rc1-kj/drivers/char/sonypi.c	2005-01-16 23:44:12.000000000 -0800
> @@ -286,17 +286,14 @@ static void sonypi_camera_on(void)

Ack.

I applied the patch to my tree and I'll send it to Linus some time
in the future when I'll have more changes.

Thanks.

Stelian.
-- 
Stelian Pop <stelian@popies.net>

--===============45570505453744992==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45570505453744992==--
