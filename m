From: Julia Lawall <julia.lawall@inria.fr>
Date: Mon, 12 Oct 2020 07:03:35 +0000
Subject: Re: [PATCH 1/5] rxrpc: use semicolons rather than commas to separate statements
Message-Id: <alpine.DEB.2.22.394.2010120903170.2901@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-2-git-send-email-Julia.Lawall@inria.fr> <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr> <1215803.1602486055@warthog.procyon.org.uk>
In-Reply-To: <1215803.1602486055@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 12 Oct 2020, David Howells wrote:

> Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> > -		call->completion = compl,
> > +		call->completion = compl;
>
> Looks good.  Do you want me to pick up the patch or send it yourself?

Please pick it up.  Thanks.

julia

>
> If the latter:
>
> Acked-by: David Howells <dhowells@redhat.com>
>
>
