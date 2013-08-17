From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 17 Aug 2013 16:08:15 +0000
Subject: Re: [PATCH 5/6] for fixing xhci_readl call in xhci_hub.c after removing xhci_hcd from function defin
Message-Id: <20130817160815.GE22811@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130816192434.GG7975@xanatos>
In-Reply-To: <20130816192434.GG7975@xanatos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 16, 2013 at 12:24:34PM -0700, Sarah Sharp wrote:
> In general, please keep the short descriptions of your patches (which
> turn into the subject lines of your mails) limited to around 55
> characters.

55 is a very austere limit.

I've been telling people 72 character the same as email.
`git citool` has a fixed width of 75 characters so that's what I
normally use in practice.

regards,
dan carpenter

