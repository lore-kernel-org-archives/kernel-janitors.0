From: Miklos Vajna <vmiklos@frugalware.org>
Date: Fri, 31 Dec 2010 10:46:38 +0000
Subject: Re: [PATCH] sched, cgroup: Use exit hook to avoid use-after-free
Message-Id: <20101231104638.GM10557@genesis.frugalware.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="DTI0mi8ndc7Chjpu"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1293128670.2170.748.camel@laptop>
 <1293132304.6798.6.camel@marge.simson.net>
 <1293132862.25981.22.camel@laptop>
 <1293187425.7138.2.camel@marge.simson.net>
 <1293188091.25981.200.camel@laptop>
 <1293192999.18035.4.camel@marge.simson.net>
 <1293206353.29444.205.camel@laptop>
 <20101229152522.GA23825@elte.hu>
 <20101229230744.GA10557@genesis.frugalware.org>
 <1293789859.6839.97.camel@marge.simson.net>
In-Reply-To: <1293789859.6839.97.camel@marge.simson.net>
To: Mike Galbraith <efault@gmx.de>
Cc: Ingo Molnar <mingo@elte.hu>, Peter Zijlstra <peterz@infradead.org>, shenghui <crosslonelyover@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg KH <greg@kroah.com>, Paul Turner <pjt@google.com>, Yong Zhang <yong.zhang0@gmail.com>, Li Zefan <lizf@cn.fujitsu.com>, Paul Menage <menage@google.com>, Balbir Singh <balbir@linux.vnet.ibm.com>, Srivatsa Vaddagiri <vatsa@in.ibm.com>


--DTI0mi8ndc7Chjpu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 31, 2010 at 11:04:19AM +0100, Mike Galbraith <efault@gmx.de> wrote:
> Your crash seems to be completely independent of Peter's patch.  It
> crashes here with your image/config/2.6.36 here regardless, and not 100%
> repeatably.  Sometimes it boots, sometimes not.

Oh, then ignore that. It's possible it's something qemu-specific, I
can't reproduce this one on my real machine.

--DTI0mi8ndc7Chjpu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEUEARECAAYFAk0dtI4ACgkQe81tAgORUJbdfQCfcFzQXdA8nFgQ7yOEV7/h3ukQ
ZMoAmLGc6Z0438WTkGad458vCHbsz3o=
=73gP
-----END PGP SIGNATURE-----

--DTI0mi8ndc7Chjpu--
