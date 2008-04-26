From: Nick Andrew <nick@nick-andrew.net>
Date: Sat, 26 Apr 2008 14:22:35 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in	header file
Message-Id: <20080426142235.GB7051@tull.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no> <48133537.7040800@cs.helsinki.fi> <19f34abd0804260717le1773aapec49cdb6f68e296f@mail.gmail.com>
In-Reply-To: <19f34abd0804260717le1773aapec49cdb6f68e296f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Pekka Enberg <penberg@cs.helsinki.fi>, Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Apr 26, 2008 at 04:17:15PM +0200, Vegard Nossum wrote:
> I didn't want to get into the lands of parsing options since we would
> need to handle gcc options and skip arguments to those, etc.

?

use Getopt::Std qw(getopts);

use vars qw($opt_g);

getopts('g');

[...]

if ($opt_g) {
	graph();
}

Nick.
-- 
PGP Key ID = 0x418487E7                      http://www.nick-andrew.net/
PGP Key fingerprint = B3ED 6894 8E49 1770 C24A  67E3 6266 6EB9 4184 87E7
