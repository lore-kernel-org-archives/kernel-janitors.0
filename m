From: Domen Puncer <domen@coderock.org>
Date: Wed, 13 Jul 2005 18:00:30 +0000
Subject: Re: [KJ] [UPDATE PATCH 14/14] telephony/ixj: use msleep() instead of
Message-Id: <20050713180030.GE21831@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39369857914474093=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050711183235.GD2603@us.ibm.com>
In-Reply-To: <20050711183235.GD2603@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============39369857914474093==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/07/05 11:32 -0700, Nishanth Aravamudan wrote:
> On 08.07.2005 [17:17:02 -0700], Nishanth Aravamudan wrote:
> > From: Nishanth Aravamudan <nacc@us.ibm.com>
> > 
> > Description: Replace schedule_timeout() with mlseep() to

						^^^

> > guarantee the task delays as expected.
> 
> Domen pointed out on IRC that these can all probably be msleep() as
> signal_pending() is currently not a means to break the loop (just a
> timeout).
> 
> Thanks,
> Nish
> 
> Description: Replace schedule_timeout() with msleep() to
> guarantee the task delays as expected.
> 
> Patch is compile-tested.

Maybe the previous version was.

> diff -urp 2.6.13-rc2-kj/drivers/telephony/ixj.c 2.6.13-rc2-kj-dev/drivers/telephony/ixj.c
> --- 2.6.13-rc2-kj/drivers/telephony/ixj.c	2005-07-06 07:57:19.000000000 -0700
> +++ 2.6.13-rc2-kj-dev/drivers/telephony/ixj.c	2005-07-08 14:13:43.000000000 -0700
> @@ -2089,13 +2080,7 @@ static int ixj_ring(IXJ *j)
>  		ixj_ring_off(j);
>  		while (time_before(jiffies, jif)) {
>  			if (ixj_hookstate(j) & 1) {
> -				det = jiffies + (hertz / 100);
> -				while (time_before(jiffies, det)) {
> -					set_current_state(TASK_INTERRUPTIBLE);
> -					schedule_timeout(1);
> -					if (signal_pending(current))
> -						break;
> -				}
> +				mlseep(10);

Is this on purpose, to match description? ;-)
Fixed in -kj.

--===============39369857914474093==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39369857914474093==--
