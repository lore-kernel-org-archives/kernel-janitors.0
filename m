From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Fri, 22 Oct 2004 21:38:48 +0000
Subject: [KJ] block/pktcdvd: set_current_state() location
Message-Id: <20041022213848.GA11126@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88160077650706636=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88160077650706636==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Jens & Peter,

I was looking through 2.6.9-bk7 with the latest kjt (Kernel-Janitors
patchset) applied and noticed a new schedule_timeout() in the code. In
drivers/block/pktcdvd.c::kcdrwd(), the state is set at the head of the
for(;;)-loop, while the sleeping doesn't occur until nearly the end of
the same loop. Is there a reason for the code in-between to run in
TASK_INTERRUPTIBLE? If not, then would it make sense to use
msleep_interruptible? Thanks for your input.

-Nish

--===============88160077650706636==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88160077650706636==--
