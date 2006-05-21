From: Henne <henne@nachtwindheim.de>
Date: Sun, 21 May 2006 22:54:11 +0000
Subject: [KJ] register_chrdev_region removal
Message-Id: <4470EF93.901@nachtwindheim.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============88550669550413996=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============88550669550413996==
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

I'm currently reading LDD3 chapter3 and wondered if there are drivers
who use register_chrdev_region().
After grepping the latest kernel tree, I found just 12 drivers who do that,
so I decided to remove it from the obsolete raw-driver.

My questions are:

Should device majors be removed from linux/major.h too,
if nothing in the kernel uses it or will that file be removed completly if
it's not needed in the whole tree?

Should it also be removed form devices.txt?

Greets,
Henne.


--===============88550669550413996==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============88550669550413996==--
