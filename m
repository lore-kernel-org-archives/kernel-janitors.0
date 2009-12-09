From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 09 Dec 2009 23:24:50 +0000
Subject: Re: [PATCH] Coding style correction on some drivers that use Generic
Message-Id: <alpine.LNX.2.00.0912100024150.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20091209143540.GA9620@vacuum.larces.uece.br> <m33a3k9k2n.fsf@intrepid.localdomain>
In-Reply-To: <m33a3k9k2n.fsf@intrepid.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Krzysztof Halasa <khc@pm.waw.pl>
Cc: Rudy Matela <rudy.matela@gmail.com>, Jan Yenya Kasprzak <kas@fi.muni.cz>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Dec 2009, Krzysztof Halasa wrote:

> > Added a space separating some if/switch/while keywords from the following
> > parenthesis to conform to the CodingStyle.
> >
> > Signed-off-by: Rudy Matela <rudy.matela@gmail.com>
> > ---
> >
> >  drivers/net/wan/cosa.c       |   10 +++++-----
> >  drivers/net/wan/hdlc_cisco.c |    8 ++++----
> >  drivers/net/wan/hdlc_x25.c   |    4 ++--
> 
> Ack from me, though a subset may already be in David Miller's tree.
> Git merge can handle it without problems I guess.
> 
> Who is to commit this?

I will take care of it once the currently undergoing merging is done.

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
