From: James Nelson <james4765@cwazy.co.uk>
Date: Fri, 21 Jan 2005 01:34:21 +0000
Subject: [KJ] [PATCH 0/2][RESEND] acorn: clean up printk()'s in
Message-Id: <20050121013420.18203.79616.51463@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============11614699362413283=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============11614699362413283==

This series of patches makes the printk()'s in drivers/acorn behave a bit better.

Re-sending them after noticing I used KERN_WARN instead of KERN_WARNING.

Diffstat output:
 fd1772.c |  142 +++++++++++++++++++++++++++++++--------------------------------
 mfmhd.c  |  138 ++++++++++++++++++++++++++++---------------------------------
 2 files changed, 136 insertions(+), 144 deletions(-)

--===============11614699362413283==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============11614699362413283==--
