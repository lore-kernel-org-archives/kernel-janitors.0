From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 04 Oct 2004 21:41:07 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6] pci-hplj.c: replace
Message-Id: <20041004214107.GA2160@linux-mips.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61051106874418348=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <281940000.1096925207@w-hlinder.beaverton.ibm.com>
In-Reply-To: <281940000.1096925207@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============61051106874418348==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 04, 2004 at 02:26:47PM -0700, Hanna Linder wrote:

> As pci_find_device is going away I have replaced this call with pci_get_device.

Looks good ...

> If  someone has access to an RM200 or RM300 and could test this I would appreciate it.

Except that piece of code isn't for an RM[23]00 but a HP Laserjet (yes,
that paper eating thing ;-) and hasn't seen any update or feedback from
the original submitters since the original submission, so the entire HPLJ
code is a candidate for removal ...

   Ralf

--===============61051106874418348==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61051106874418348==--
