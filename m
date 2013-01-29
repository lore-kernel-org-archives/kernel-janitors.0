From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 29 Jan 2013 18:38:19 +0000
Subject: Re: coccinelle and bitmask arithmetic (was: Re: [patch] TTY: synclink, small cleanup in dtr_rts())
Message-Id: <alpine.DEB.2.02.1301291937250.3339@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
 <1359475998.4196.26.camel@joe-AO722>
In-Reply-To: <1359475998.4196.26.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

The following rule looks promising:

@r@
constant c;
identifier i;
expression e;
@@

(
e | c@i
|
e & c@i
|
e |= c@i
|
e &= c@i
)

@@
constant r.c,c1;
identifier i1;
expression e;
@@

*c1@i1 + c

That is, the sum of two constants where at least one of them has been used
with & or |.

julia
