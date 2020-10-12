From: David Howells <dhowells@redhat.com>
Date: Mon, 12 Oct 2020 07:00:55 +0000
Subject: Re: [PATCH 1/5] rxrpc: use semicolons rather than commas to separate statements
Message-Id: <1215803.1602486055@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602412498-32025-2-git-send-email-Julia.Lawall@inria.fr> <1602412498-32025-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602412498-32025-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: dhowells@redhat.com, =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, linux-afs@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Julia Lawall <Julia.Lawall@inria.fr> wrote:

> -		call->completion = compl,
> +		call->completion = compl;

Looks good.  Do you want me to pick up the patch or send it yourself?

If the latter:

Acked-by: David Howells <dhowells@redhat.com>
