From: Diego Woitasen <diego@woitasen.com.ar>
Date: Tue, 10 Jul 2007 02:12:17 +0000
Subject: BLK question
Message-Id: <20070710021217.GB19502@motherbox.xtechq.com.ar>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Hi,
	I want to know is BLK is really deprecated. I see that is used
	in many places in the kernel, but the comments in the blk code
	say "Don't use in new code".

	For example, reading the driver/pci/syscall.c I see that
	sys_pciconfig_write() and sys_pciconfig_read() use it to control
	the concurrency between these calls. Could this
	lock_kernel()/unlock_kernel() be replaced by a local mutex?

	regards,
		diegows

-- 

--------------
Diego Woitasen
