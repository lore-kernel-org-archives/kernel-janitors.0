From: Pablo Neira Ayuso <pablo@netfilter.org>
Date: Mon, 16 Nov 2020 09:17:36 +0000
Subject: Re: [PATCH] MAINTAINERS: rectify file patterns for NETFILTER
Message-Id: <20201116091736.GA32490@salvia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201109091942.32280-1-lukas.bulwahn@gmail.com>
 <d03c87f9fcc4bb68c148cfad12cafef5f2385eef.camel@perches.com>
In-Reply-To: <d03c87f9fcc4bb68c148cfad12cafef5f2385eef.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Joe Perches <joe@perches.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Lukas,

On Sun, Nov 15, 2020 at 07:58:33PM -0800, Joe Perches wrote:
> On Mon, 2020-11-09 at 10:19 +0100, Lukas Bulwahn wrote:
> > The two file patterns in the NETFILTER section:
> > 
> >   F:      include/linux/netfilter*
> >   F:      include/uapi/linux/netfilter*
> > 
> > intended to match the directories:
> > 
> >   ./include{/uapi}/linux/netfilter_{arp,bridge,ipv4,ipv6}
> > 
> > A quick check with ./scripts/get_maintainer.pl --letters -f will show that
> > they are not matched, though, because this pattern only matches files, but
> > not directories.
> > 
> > Rectify the patterns to match the intended directories.
> []
> diff --git a/MAINTAINERS b/MAINTAINERS
> []
> > @@ -12139,10 +12139,10 @@ W:	http://www.nftables.org/
> >  Q:	http://patchwork.ozlabs.org/project/netfilter-devel/list/
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git
> >  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git
> > -F:	include/linux/netfilter*
> > +F:	include/linux/netfilter*/
> >  F:	include/linux/netfilter/
> 
> This line could be deleted or perhaps moved up one line above
> 
> F:	include/linux/netfilter/
> F:	include/linux/netfilter*/
> 
> (as the second line already matches the first line's files too)
> 
> >  F:	include/net/netfilter/
> > -F:	include/uapi/linux/netfilter*
> > +F:	include/uapi/linux/netfilter*/
> >  F:	include/uapi/linux/netfilter/
> 
> same here.
> 
> >  F:	net/*/netfilter.c
> >  F:	net/*/netfilter/

Please, send a v2 to address this feedback. Thank you.
