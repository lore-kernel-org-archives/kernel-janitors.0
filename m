From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 06 Jan 2005 00:14:00 +0000
Subject: [KJ] ftape/fdc-io: schedule_timeout() usage
Message-Id: <20050106001400.GB2840@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============36476556253355197=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============36476556253355197==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I'm hoping someone here can help me correct some ftape code.
drivers/char/ftape/lowlevel/fdc-io.c::fdc_interrupt_wait() contains the
following code:

set_current_state(TASK_INTERRUPTIBLE);
add_wait_queue((&ftape_wait_intr, &wait);
while (!ft_interrupt_seen && (current->state == TASK_INTERRUPTIBLE)) {
	timeout = schedule_timeout(timeout);
}

The problem I have is that after the first iteration of the loop
(schedule_timeout() with TASK_INTERRUPTIBLE), it will become a busy-wait, as
schedule_timeout() will be running with current->state set to TASK_RUNNING. I'm
not sure if this is desired, but it seems weird to me. Any input would be
appreciated.

-Nish

--===============36476556253355197==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============36476556253355197==--
