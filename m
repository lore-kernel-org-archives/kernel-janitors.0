From: James Nelson <james4765@cwazy.co.uk>
Date: Fri, 21 Jan 2005 01:07:45 +0000
Subject: [KJ] [PATCH 0/2] acorn: clean up printk()'s in drivers/acorn/block/*
Message-Id: <20050121010742.18138.73955.64897@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23651266621681044=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23651266621681044==

This series of patches makes the printk()'s in drivers/acorn behave a bit better.

Diffstat output:
 fd1772.c |  142 +++++++++++++++++++++++++++++++--------------------------------
 mfmhd.c  |  138 ++++++++++++++++++++++++++++---------------------------------
 2 files changed, 136 insertions(+), 144 deletions(-)

--===============23651266621681044==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23651266621681044==--
