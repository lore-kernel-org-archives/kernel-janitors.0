From: Joe Perches <joe@perches.com>
Date: Fri, 16 Sep 2011 16:32:16 +0000
Subject: Re: [PATCH 3/4] drivers/scsi/mpt2sas/mpt2sas_transport.c: take size
Message-Id: <1316190736.19950.2.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1316156255-19509-3-git-send-email-julia@diku.dk>
In-Reply-To: <1316156255-19509-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, kernel-janitors@vger.kernel.org, Kashyap Desai <kashyap.desai@lsi.com>, James Bottomley <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2011-09-16 at 08:57 +0200, Julia Lawall wrote:
> Sizeof a pointer-typed expression returns the size of the pointer, not that
> of the pointed data.

Hi Julia.

I submitted the same thing in May.
I hope it takes this time.

https://lkml.org/lkml/2011/5/9/31


