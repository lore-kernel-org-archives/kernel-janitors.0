From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 13 Jul 2004 17:10:30 +0000
Subject: [Kernel-janitors] no set_current_state() before schedule_timeout()
Message-Id: <40F41786.4080509@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3671288360012972=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40F41170.7030605@us.ibm.com>
In-Reply-To: <40F41170.7030605@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============3671288360012972==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

In continuing to replace, where appropriate, code with msleep() calls, I 
ran across the following files / functions, which do not invoke 
set_current_state() before schedule_timeout(), which causes the latter 
to return immediately:

drivers/isdn/icn/icn.c::icn_command()
drivers/isdn/isdnloop/isdnloop.c::isdnloop_command()

Also, in

drivers/isdn/icn/icn.c::SLEEP()

I am wondering if the macro must necessarily run in TASK_INTERRUPTIBLE? 
If not, then I can replace it directly with a call to msleep().

Thanks,
Nish

--===============3671288360012972==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3671288360012972==--
