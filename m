From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Sun, 09 Jan 2005 09:01:21 +0000
Subject: [KJ] Re: [UPDATE PATCH] ieee1394/sbp2: use ssleep() instead of
Message-Id: <17a9eec54394ded0a28295a6548a5c65@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41719417163418249=="
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20050107213400.GD2924@us.ibm.com>
To: linux1394-devel@lists.sourceforge.net
Cc: kj <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, bcollins@debian.org, Nishanth Aravamudan <nacc@us.ibm.com>

--===============41719417163418249==
Content-Type: text/plain; charset="us-ascii"; format="flowed"

Nishanth Aravamudan wrote:
> Description: Use ssleep() instead of schedule_timeout() to guarantee 
> the task
> delays as expected. The existing code should not really need to run in
> TASK_INTERRUPTIBLE, as there is no check for signals (or even an 
> early return
> value whatsoever). ssleep() takes care of these issues.

> --- 2.6.10-v/drivers/ieee1394/sbp2.c	2004-12-24 13:34:00.000000000 
> -0800
> +++ 2.6.10/drivers/ieee1394/sbp2.c	2005-01-05 14:23:05.000000000 -0800
> @@ -902,8 +902,7 @@ alloc_fail:
> 	 * connected to the sbp2 device being removed. That host would
> 	 * have a certain amount of time to relogin before the sbp2 device
> 	 * allows someone else to login instead. One second makes sense. */
> -	set_current_state(TASK_INTERRUPTIBLE);
> -	schedule_timeout(HZ);
> +	ssleep(1);

Maybe the current code is _deliberately_ accepting interruption by 
signals but trying to complete sbp2_probe() anyway. However it seems 
more plausible to me to abort the device probe, for example like this:
if (msleep_interruptible(1000)) {
	sbp2_remove_device(scsi_id);
	return -EINTR;
}
Anyway, signal handling does not appear to be critical there.
-- 
Stefan Richter
-=====-=-=-= ---= -=--=
http://arcgraph.de/sr/


--===============41719417163418249==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41719417163418249==--
