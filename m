From: Clemens Ladisch <clemens@ladisch.de>
Date: Wed, 03 Nov 2004 09:31:42 +0000
Subject: [KJ] Re: [Alsa-devel] [PATCH] sound/cs4231: replace
Message-Id: <Pine.HPX.4.33n.0411031024450.25361-100000@studcom.urz.uni-halle.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58995604675991675=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
In-Reply-To: <Pine.HPX.4.33n.0411031010440.25361-100000@studcom.urz.uni-halle.de>
To: kernel-janitors@vger.kernel.org

--===============58995604675991675==
Content-Type: TEXT/PLAIN; charset=US-ASCII

Nishanth Aravamudan wrote:
> +	time = 250;
>  	while (snd_cs4231_in(chip, CS4231_TEST_INIT) & CS4231_CALIB_IN_PROGRESS) {
>  		spin_unlock_irqrestore(&chip->lock, flags);
>  		if (time <= 0) {
>  			snd_printk("mce_down - auto calibration time out (2)\n");
>  			return;
>  		}
> -		set_current_state(TASK_INTERRUPTIBLE);
> -		time = schedule_timeout(time);
> +		time = msleep_interruptible(time);
>  		spin_lock_irqsave(&chip->lock, flags);
>  	}
>
> Description: Uses msleep_interruptible() instead of schedule_timeout()
> to guarantee the task delays as expected.

The SPARC driver originated as a copy of the ISA driver and still has
the problem that was fixed there, i.e., it uses a single 250 ms wait
(which results in a delay of several seconds if OSS programs try to
enumerate sample rates).

Like the ISA driver, this driver should check the hardware status more
often so that the wait can be aborted as soon as the calibration has
finished.

And this driver doesn't expect do receive signals; using msleep()
would be just fine.


Clemens


--===============58995604675991675==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58995604675991675==--
