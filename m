From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 25 Jan 2005 21:47:01 +0000
Subject: [KJ] MIPS still uses sleep_on*()
Message-Id: <20050125214701.GA2689@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============51415710615021748=="
List-Id: <kernel-janitors.vger.kernel.org>
To: ralf@linux-mips.org
Cc: linux-mips@linux-mips.org, kernel-janitors@lists.osdl.org

--===============51415710615021748==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I am trying to clean up the remaning sleep_on*() calls in the kernel. These
functions have been deprecated for a *long* time, just never completely removed
:)

The only file I'm not comfortable with changing myself (since I am not a MIPS
user/expert) is arch/mips/kernel/process.c. This file references sleep_on(),
sleep_on_timeout(), interruptible_sleep_on() and
interruptible_sleep_on_timeout().

This file is (presuming my upcoming patches for sleep_on() go through
Kernel-Janitors ok) the final one before we can declare the kernel clean of
sleep_on() callers -- the other members of the family will take longer.

Any insight anyone could provide would be great, so that this milestone (for me,
at least) can be achieved.

Thanks,
Nish

--===============51415710615021748==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============51415710615021748==--
