From: Florian Westphal <fw@strlen.de>
Date: Tue, 16 Apr 2019 09:12:14 +0000
Subject: Re: [PATCH] [NETFILTER]: nf_conntrack_h323: fix spelling mistake "authenticaton" -> "authentication"
Message-Id: <20190416091214.vjydcg3xblxtvosk@breakpoint.cc>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190415114414.24600-1-colin.king@canonical.com>
 <90e0d4af-77c5-6e4b-a364-5b9e342c83be@codeaurora.org>
In-Reply-To: <90e0d4af-77c5-6e4b-a364-5b9e342c83be@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mukesh Ojha <mojha@codeaurora.org>
Cc: Colin King <colin.king@canonical.com>, Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>, Florian Westphal <fw@strlen.de>, "David S . Miller" <davem@davemloft.net>, netfilter-devel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/15/2019 5:14 PM, Colin King wrote:
> > diff --git a/net/netfilter/nf_conntrack_h323_types.c b/net/netfilter/nf_conntrack_h323_types.c
> > index d880f3523c1d..95a0b3d6b24d 100644
> > --- a/net/netfilter/nf_conntrack_h323_types.c
> > +++ b/net/netfilter/nf_conntrack_h323_types.c
> > @@ -1109,7 +1109,7 @@ static const struct field_t _SecurityCapabilities[] = {	/* SEQUENCE */
> >   	 _NonStandardParameter},
> >   	{FNAME("encryption") CHOICE, 2, 3, 3, SKIP | EXT, 0,
> >   	 _SecurityServiceMode},
> > -	{FNAME("authenticaton") CHOICE, 2, 3, 3, SKIP | EXT, 0,
> > +	{FNAME("authentication") CHOICE, 2, 3, 3, SKIP | EXT, 0,
> >   	 _SecurityServiceMode},
> >   	{FNAME("integrity") CHOICE, 2, 3, 3, SKIP | EXT, 0,
> >   	 _SecurityServiceMode},

https://www.itu.int/ITU-T/formal-language/itu-t/h/h225-0/2009/H323-MESSAGES.html says:
		         ...
SecurityCapabilities ::= SEQUENCE {
nonStandard    NonStandardParameter OPTIONAL,
encryption     SecurityServiceMode,
authenticaton  SecurityServiceMode,
integrity      SecurityServiceMode,
...
}

so this spelling seems intentional.
