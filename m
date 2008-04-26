From: Pekka Enberg <penberg@cs.helsinki.fi>
Date: Sat, 26 Apr 2008 13:59:19 +0000
Subject: Re: [PATCH] headerdep: a tool for detecting inclusion cycles in header
Message-Id: <48133537.7040800@cs.helsinki.fi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080426134554.GA20727@damson.getinternet.no>
In-Reply-To: <20080426134554.GA20727@damson.getinternet.no>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Adrian Bunk <bunk@kernel.org>, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Vegard,

Vegard Nossum wrote:
> @@ -0,0 +1,143 @@
> +#! /usr/bin/perl
> +#
> +# Detect cycles in the header file dependency graph
> +# Vegard Nossum <vegardno@ifi.uio.no>
> +#
> +
> +use strict;
> +use warnings;
> +
> +my @I = ('include');
> +my %deps = ();
> +
> +my @headers = grep { strip($_) } @ARGV;
> +
> +parse_all(@headers);
> +
> +detect_cycles(@headers);
> +#graph();

[snip]

> +exit;

> +# Output dependency graph in GraphViz language.
> +sub graph {

Shouldn't there be a command line option for printing out the GraphViz 
files?
