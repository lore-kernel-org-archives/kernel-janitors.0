From: Domen Puncer <domen@coderock.org>
Date: Wed, 16 Feb 2005 13:25:30 +0000
Subject: Re: [KJ] RE: [PATCH 14/21] net/s2io: replace schedule_timeout() with
Message-Id: <20050216132530.GE18025@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20144209681309322=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200501172315.j0HNFAaH027053@guinness.s2io.com>
In-Reply-To: <200501172315.j0HNFAaH027053@guinness.s2io.com>
To: kernel-janitors@vger.kernel.org

--===============20144209681309322==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

--===============20144209681309322==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20144209681309322==--
