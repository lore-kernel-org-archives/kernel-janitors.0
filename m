From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 02 Nov 2004 00:30:31 +0000
Subject: [KJ] sc423x's usage of schedule_timeout()
Message-Id: <20041102003031.GD4255@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7323750863798455=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7323750863798455==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am going through the kernel, as part of the Kernel-Janitors TODO and
replacing schedule_timeout() with msleep() and its variants. In this
process, I came across

sound/isa/cs423x/cs4231_lib.c

which contains the following code:

	timeout = HZ / 4 / 2;
	time = 2;
	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
		set_current_state(TASK_INTERRUPTIBLE);
		time = schedule_timeout(time);
		if (time > 0)
			continue;
		time = 2;
		if (--timeout < 0) {
			snd_printk("mce_down - auto calibration time out (2)\n");
			return;
		}
	}

This code seems pretty strange, as the delay is in terms of time, which
seems to mean the loop (as long as the condition is true, of course)
sleeps for 2 jiffies, then sleeps for another 2, about HZ / 4 / 2 (HZ /
8) times. This results in a maximal delay of HZ / 4 jiffies...

This just seemed like a very strange coding style. Perhaps that is just
me, though.

My first concern, though, is whether perhaps here the time and timeout
values have been switched, as it's unusual to treat any variable whose
value is expressed in terms of HZ as a counter (or really anything
except a time variable).

Please let me know if this code should be left as is, or should be fixed
(and how?).

Thanks,
Nish

--===============7323750863798455==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7323750863798455==--
