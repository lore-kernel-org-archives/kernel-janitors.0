From: Roger Luethi <rl@hellgate.ch>
Date: Mon, 12 Jul 2004 16:30:54 +0000
Subject: Re: [Kernel-janitors] [PATCH] remove check_region specialix
Message-Id: <20040712163054.GA8681@k3.hellgate.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
In-Reply-To: <200407072024.i67KOdQM017410@sirius.cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, 12 Jul 2004 09:11:51 -0700, Kristen Carlson wrote:
> Thanks!  For my benefit, what's the easiest way to check for trailing spa=
ces?

One way is to have your editor show them. I have this in my .vimrc
(the characters I picked may or may not work well for your locale):
set list
set listchars=3Dtab:=BB=B7,trail:=B7

Works for me.

Roger
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
