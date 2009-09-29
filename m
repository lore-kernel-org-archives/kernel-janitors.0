From: Jeff Garzik <jgarzik@pobox.com>
Date: Tue, 29 Sep 2009 02:01:20 +0000
Subject: Re: [PATCH] trivial fix of a very frequent spelling mistake
Message-Id: <4AC16A70.2020300@pobox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090929015607.GA18220@bombadil.infradead.org>
In-Reply-To: <20090929015607.GA18220@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Hohndel <hohndel@infradead.org>
Cc: Jin Kosina <trivial@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org

On 09/28/2009 09:56 PM, Dirk Hohndel wrote:
> something-bility is spelled as something-blity
> so a grep for 'blit' would find these lines
>
> I broke this one out from the rest as it actually changes
> the output of a kernel message - so it could in theory
> change the behavior of tools that parse that ouput
>
> Jeff, can you sign-off / NAK this, please?
>
> Signed-off-by: Dirk Hohndel<hohndel@infradead.org>
> ---
>   drivers/ata/pata_ali.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)

Yep, will send in the upcoming bug fix push...


