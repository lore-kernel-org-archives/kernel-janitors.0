From: James Nelson <james4765@cwazy.co.uk>
Date: Mon, 24 Jan 2005 21:14:13 +0000
Subject: [KJ] [PATCH 0/2][RESEND] acorn: clean up printk()'s in
Message-Id: <20050124211400.5730.89945.15536@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26430260606803158=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050121013420.18203.79616.51463@localhost.localdomain>
In-Reply-To: <20050121013420.18203.79616.51463@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============26430260606803158==

This series of patches makes the printk()'s in drivers/acorn behave a bit better.

Re-sending them after feedback from Domen Puncer.

Diffstat output:
 fd1772.c |  138 ++++++++++++++++++++++++++++------------------------------
 mfmhd.c  |  148 ++++++++++++++++++++++++++++-----------------------------------
 2 files changed, 134 insertions(+), 152 deletions(-)

--===============26430260606803158==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26430260606803158==--
