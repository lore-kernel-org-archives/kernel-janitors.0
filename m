From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 13 Jun 2004 00:24:45 +0000
Subject: Re: [Kernel-janitors] panic todo?
Message-Id: <20040612172445.7e34ab23.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============50857975402171984=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
In-Reply-To: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============50857975402171984==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 12 Jun 2004 11:53:36 +0200 (Walter Harms) wrote:

| 
| hi,
| just for my understanding. i would exspect a halt on panic()
| while a machine_reboot() is a reboot !?

RTSL.  or read Documentation/kernel-parameters.txt:

doc:
	panic=		[KNL] Kernel behaviour on panic
			Format: <timeout>

source: kernel/panic.c::panic():

	if (panic_timeout > 0)
	{
		int i;
		/*
	 	 * Delay timeout seconds before rebooting the machine. 
		 * We can't use the "normal" timers since we just panicked..
	 	 */
		printk(KERN_EMERG "Rebooting in %d seconds..",panic_timeout);
		for (i = 0; i < panic_timeout; i++) {
			touch_nmi_watchdog();
			mdelay(1000);
		}
		/*
		 *	Should we run the reboot notifier. For the moment Im
		 *	choosing not too. It might crash, be corrupt or do
		 *	more harm than good for other reasons.
		 */
		machine_restart(NULL);
	}


So the default behavior is to panic and halt, but there is an
option to restart after panic if that's what is needed/wanted.


| - - - - - - - - - - - - - - Original Message - - - - - - - - - - - - - -
| From: Kristen Carlson <kristenc@cs.pdx.edu>
| Subject: [Kernel-janitors] panic todo?
| Date: 06/11/04 21:26
| 
| Hello,
| I was wondering if anyone was working on the item listed in the "TODO" file
| regarding removing panic() from drivers and replacing it with machine_restart()?
| 
| Thanks,
| Kristen


--
~Randy

--===============50857975402171984==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============50857975402171984==--
