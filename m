From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Fri, 10 Feb 2006 13:21:38 +0000
Subject: [KJ] Fwd: libata janitor project
Message-Id: <20060210132138.GA11586@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57531445953184313=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57531445953184313==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

----- Forwarded message from Jeff Garzik <jgarzik@pobox.com> -----

From: Jeff Garzik <jgarzik@pobox.com>
To: "linux-ide@vger.kernel.org" <linux-ide@vger.kernel.org>
CC: Linux Kernel <linux-kernel@vger.kernel.org>
Subject: libata janitor project


Long term, we should work to replace the assert() in libata with 
standard kernel WARN_ON().

If someone wanted to handle that conversion, that would be useful.  Make 
sure to pay attention, the sense of each test must be reversed.

	Jeff


--===============57531445953184313==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57531445953184313==--
