From: Takashi Iwai <tiwai@suse.de>
Date: Mon, 24 Jan 2005 14:10:23 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH 30/39] sound/vx_core: replace
Message-Id: <s5hmzuy2a0g.wl@alsa2.suse.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56751150993483668=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050121194731.GK3340@us.ibm.com>
In-Reply-To: <20050121194731.GK3340@us.ibm.com>
To: Nishanth Aravamudan <nacc@us.ibm.com>
Cc: perex@suse.cz, alsa-devel@alsa-project.org, kernel-janitors@lists.osdl.org

--===============56751150993483668==
Content-Type: text/plain; charset=US-ASCII

At Fri, 21 Jan 2005 11:47:31 -0800,
Nishanth Aravamudan wrote:
> 
> Hi,
> 
> Please consider applying.
> 
> Description: Use msleep() instead of schedule_timeout() to guarantee the task
> delays as expected. The check for xmsec >= 1000 / HZ seems wrong to me, as well,
> since if HZ==100, that means we could mdelay() for 9 msecs!

Yes, and that's intentional.  Originally there were places to call
like snd_vx_delay(1) for just 1 or 2 ms in a long loop.  The loop
calls schedule() occasionally to take control back.
So, we didn't want to do schedule_timeout(1) for HZ=100 in such a
case.  This results in 10 times longer loop execution.

>  msleep() should be
> usable in all cases when not in an interrupt handler.

I agree in general, but, msleep() isn't always a replacement of
mdelay() if the delay time really matters.


Takashi

--===============56751150993483668==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56751150993483668==--
