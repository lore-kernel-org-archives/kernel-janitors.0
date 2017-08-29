From: Pawel Moll <pawel.moll@arm.com>
Date: Tue, 29 Aug 2017 08:49:03 +0000
Subject: Re: [PATCH 1/2] bus: arm-ccn: Check memory allocation failure
Message-Id: <1503996543.3460.4.camel@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170827100650.13236-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170827100650.13236-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 2017-08-27 at 12:06 +0200, Christophe JAILLET wrote:
> Check memory allocation failures and return -ENOMEM in such cases
> 
> This avoids a potential NULL pointer dereference.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is an obvious bug, thanks for spotting and fixing it! I'll include
this patch next time I send a pull request for CCN fixes.

May I also ask how have you noticed it? Some automated tool or just
manual code inspection?

Regards

Pawel
