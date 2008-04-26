From: Jan Engelhardt <jengelh@computergmbh.de>
Date: Sat, 26 Apr 2008 18:03:14 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in
Message-Id: <alpine.LNX.1.10.0804262001400.20150@fbirervta.pbzchgretzou.qr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no> <48133537.7040800@cs.helsinki.fi> <19f34abd0804260717le1773aapec49cdb6f68e296f@mail.gmail.com> <20080426142235.GB7051@tull.net>
In-Reply-To: <20080426142235.GB7051@tull.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Andrew <nick@nick-andrew.net>
Cc: Vegard Nossum <vegard.nossum@gmail.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On Saturday 2008-04-26 16:22, Nick Andrew wrote:
>On Sat, Apr 26, 2008 at 04:17:15PM +0200, Vegard Nossum wrote:
>> I didn't want to get into the lands of parsing options since we would
>> need to handle gcc options and skip arguments to those, etc.
>
>?
>
>use Getopt::Std qw(getopts);
>use vars qw($opt_g);
>getopts('g');
>[...]
>if ($opt_g) {
>	graph();
>}

Try this, at least it is known to handle pass_through, which
is _just what we want_ for handling unknown options:

	use Getopt::Long;
	&Getopt::Long::Configure(qw(bundling pass_through));
	&GetOptions("g" => \$opt_g, "I" => \@include_paths);
