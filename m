From: Roger Luethi <rl@hellgate.ch>
Date: Tue, 13 Jul 2004 10:53:00 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <20040713105259.GA30087@k3.hellgate.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============21088346782117684=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============21088346782117684==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 12 Jul 2004 18:55:39 -0700, Randy.Dunlap wrote:
> This is my 'dryrun' script:
> 
> #! /bin/sh
> patch -sp1 --dry-run -i $1 $2 $3 $4 $5 $6 $7 $8 $9

What are all these arguments meant for? Why not $@?

> echo "===== trailing spaces? ====="
> grep -n "^+.* $" $1 | more

How about
grep -n '^+.*[[:space:]]$'
instead? Catches trailing tabs as well. And yes, there are plenty of those
in the kernel.

I notice whitespace problems when I review the code anyway, but script
users should also try and catch these:

  	f();
should really be
	f();

Roger

--===============21088346782117684==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============21088346782117684==--
