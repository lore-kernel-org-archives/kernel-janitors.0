From: Ingo Molnar <mingo@redhat.com>
Date: Sat, 24 Jul 2004 11:33:31 +0000
Subject: [Kernel-janitors] Re: [PATCH] md: replace schedule_timeout() with
Message-Id: <Pine.LNX.4.58.0407240731440.16034@devserv.devel.redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============077455950368690241=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============077455950368690241==
Content-Type: TEXT/PLAIN; charset=US-ASCII


On Fri, 23 Jul 2004, Nishanth Aravamudan wrote:

> --- linux-vanilla/drivers/md/md.c	2004-06-16 05:19:03.000000000 +0000
> +++ linux-dev/drivers/md/md.c	2004-07-12 18:47:53.000000000 +0000
> @@ -3438,8 +3438,7 @@ static void md_do_sync(mddev_t *mddev)
>  		if (currspeed > sysctl_speed_limit_min) {
>  			if ((currspeed > sysctl_speed_limit_max) ||
>  					!is_mddev_idle(mddev)) {
> -				current->state = TASK_INTERRUPTIBLE;
> -				schedule_timeout(HZ/4);
> +				msleep(250);

well, it's not 100% equivalent because msleep() is uninterruptible so
stoppage of the md thread (upon shutdown) will occur with only a 250 msec
delay. Someone should add a msleep_interruptible() function to
kernel/timer.c.

	Ingo

--===============077455950368690241==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============077455950368690241==--
