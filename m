From: "Ravinandan Arakali" <ravinandan.arakali@neterion.com>
Date: Wed, 16 Feb 2005 23:54:06 +0000
Subject: RE: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <000b01c51482$cd177de0$4510100a@pc.s2io.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============99678953694437844=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============99678953694437844==
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Domen,
Thanks for pointing that out. As you mention, the intention is
indeed to wait for Ctrl+C.
Nishanth, are you planning to modify it to msleep_interruptible().
If so, pls note that I submitted a Multicast fix after your below
patch. Pls apply multicast patch before changing to msleep_interruptible().

Ravi

-----Original Message-----
From: Domen Puncer [mailto:domen@coderock.org]
Sent: Wednesday, February 16, 2005 5:26 AM
To: Ravinandan Arakali
Cc: 'Raghavendra Koushik'; 'Nishanth Aravamudan';
kernel-janitors@lists.osdl.org; leonid.grossman@neterion.com
Subject: Re: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout()
with msleep()


On 09/02/05 10:37 -0800, Ravinandan Arakali wrote:
> Nishanth,
> We did some basic testing after applying your patch and it seems okay.
...
>
> In the function s2io_ethtool_idnic(), call to schedule_timeout() has not
> been replaced with msleep(). I've given below the code change I did before
> testing.
>
> @@ -3284,11 +3277,10 @@
>                 sp->id_timer.data = (unsigned long) sp;
>         }
>         mod_timer(&sp->id_timer, jiffies);
> -       set_current_state(TASK_INTERRUPTIBLE);
>         if (data)
> -               schedule_timeout(data * HZ);
> +               msleep(data*1000);
>         else
> -               schedule_timeout(MAX_SCHEDULE_TIMEOUT);
> +               msleep(0xFFFFFFFF);

Was this code path tested too? It looks weird, as msleep _will_ sleep
for almost a day.
I don't know ethtool, but might this 'idnic' with undefined sleep time
just wait for ctrl+c for example? If that is so, msleep_interruptible
is what you want.

>         del_timer_sync(&sp->id_timer);
>
>         if (CARDS_WITH_FAULTY_LINK_INDICATORS(subid)) {
>


--===============99678953694437844==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============99678953694437844==--
