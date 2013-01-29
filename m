From: Joe Perches <joe@perches.com>
Date: Tue, 29 Jan 2013 16:31:04 +0000
Subject: Re: coccinelle and bitmask arithmetic (was: Re: [patch] TTY: synclink, small cleanup in dtr_rts())
Message-Id: <1359477064.4196.30.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130127194039.GA18787@elgon.mountain>
 <1359317078.14406.12.camel@joe-AO722> <20130127201947.GO16282@mwanda>
 <9561.1359474916@turing-police.cc.vt.edu>
 <1359475998.4196.26.camel@joe-AO722>
 <alpine.DEB.2.02.1301291717530.3339@hadrien>
In-Reply-To: <alpine.DEB.2.02.1301291717530.3339@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

On Tue, 2013-01-29 at 17:19 +0100, Julia Lawall wrote:
> > On Tue, 2013-01-29 at 10:55 -0500, Valdis.Kletnieks@vt.edu wrote:
[]
> > > I wonder if there's a way to write a coccinelle patch to find places
> > > where we do arithmetic operations on bitmasks....
[]
> If the definition of a bitmask is an identifier in all capital letters,
> that would be easy.  Another possibility is such an identifier that is
> defined to a value expressed beginning with 0x.  Another possibility is
> such an identifier that is sometimes used with & and | and sometimes used
> with an arithmetic operation.  I will give them a try.

Thanks Julia.


