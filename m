From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 16:44:32 +0000
Subject: [Kernel-janitors] no set_current_state() before schedule_timeout()
Message-Id: <40F41170.7030605@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============020889495188973761=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============020889495188973761==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In continuing to replace, where appropriate, code with msleep() calls, I 
ran across the following files / functions, all of which do not invoke 
set_current_state() before schedule_timeout(), which causes the latter 
to return immediately:

drivers/mtd/chips/cfi_cmdset_0001.c::do_xxlock_one_block()
drivers/mtd/chips/cfi_cmdset_0001.c::do_erase_chip()
drivers/mtd/chips/amd_flash.c::erase_one_block()
drivers/mtd/chips/cfi_cmdset_0002.c::do_erase_chip()
drivers/mtd/chips/cfi_cmdset_0002.c::do_erase_oneblock()
drivers/mtd/chips/cfi_cmdset_0020.c::do_erase_oneblock()
drivers/mtd/chips/cfi_cmdset_0020.c::do_lock_oneblock()
drivers/mtd/chips/cfi_cmdset_0020.c::do_unlock_oneblock()

If someone could tell me which state (TASK_INTERRUPTIBLE or 
TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the 
calls with msleep().

Thanks,
Nish

--===============020889495188973761==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============020889495188973761==--
