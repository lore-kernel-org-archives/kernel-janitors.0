From: Clemens Ladisch <clemens@ladisch.de>
Date: Tue, 02 Nov 2004 12:20:04 +0000
Subject: [KJ] Re: [Alsa-devel] sc423x's usage of schedule_timeout()
Message-Id: <Pine.HPX.4.33n.0411021308490.27226-100000@studcom.urz.uni-halle.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============64731503854267403=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============64731503854267403==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Nishanth Aravamudan wrote:
> sound/isa/cs423x/cs4231_lib.c
>
> which contains the following code:
>
> 	timeout = HZ / 4 / 2;
> 	time = 2;
> 	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
> 		set_current_state(TASK_INTERRUPTIBLE);
> 		time = schedule_timeout(time);
> 		if (time > 0)
> 			continue;
> 		time = 2;
> 		if (--timeout < 0) {
> 			snd_printk("mce_down - auto calibration time out (2)\n");
> 			return;
> 		}
> 	}
>
> This code seems pretty strange, as the delay is in terms of time, which
> seems to mean the loop (as long as the condition is true, of course)
> sleeps for 2 jiffies, then sleeps for another 2, about HZ / 4 / 2 (HZ /
> 8) times. This results in a maximal delay of HZ / 4 jiffies...

This code was introduced in revision 1.29:
http://cvs.sourceforge.net/viewcvs.py/alsa/alsa-kernel/isa/cs423x/cs4231_lib.c?rev=HEAD&view=log#rev1.29

Originally, there was a single timeout of 250 ms, but it had to be
split up into several waits to be able to check the chip status more
frequently.

There is no reason to use 2 jiffies -- the code was written assuming
HZ=100 (for 20ms waits), but now this isn't the case anyway.

BTW: Using TASK_INTERRUPTIBLE isn't quite correct because we don't
check for signals here.


Regards,
Clemens


--===============64731503854267403==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============64731503854267403==--
