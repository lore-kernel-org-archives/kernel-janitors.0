From: Dale Sedivec <dale-keyword-kerneljanitors.5631dd@codefu.org>
Date: Mon, 13 Mar 2006 00:07:17 +0000
Subject: [KJ] Clarifying process for submitting a patch
Message-Id: <20060313000717.GA19862@morgase.caliginous.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46481833302848941=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46481833302848941==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	I just jumped in and started working on the __init/__exit
issue (from the TODO list).  I've got a small patch against the au88x0
(Aureal Vortex, I guess) sound driver ready to go.  I understand most
of the process for submitting a patch, but a few things aren't clear
to me:

1. Do I or don't I include the kernel version being patched against?
   Documentation/SubmittingPatches says to,
   http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt (4b) says
   not to.  Should I include the version in the subject line, as
   specified in http://linux.yyz.us/patch-format.html?  I don't see
   anyone on k-j doing this.

2. In general, who should I send to when submitting patches for k-j
   items?  Possibilities apparently include:

   * kernel-janitors@lists.osdl.org
   * The driver maintainer
   * The subsystem maintainer
   * The subsystem mailing list
   * LKML
   * Trivial patch monkey

   Which of these should I send to?  Obviously only "trivial" patches
   get send to trivial patch monkey.  I see some people on k-j Cc'ing
   LKML, but some others don't.

3. I believe I read that it's good to submit a small patch to k-j
   first to see if it works.  Should that be sent _only_ to k-j?  If
   so, and if no one brings up any problems with the format of the
   patch on k-j, am I then supposed to resend that patch to some/all
   of the above places?

Thanks,
Dale

--===============46481833302848941==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46481833302848941==--
