From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Wed, 14 Feb 2018 11:48:02 +0000
Subject: Re: [PATCH] esp4: remove redundant initialization of pointer esph
Message-Id: <20180214114802.dc55jiwj4zwntewh@gauss3.secunet.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180130145348.32202-1-colin.king@canonical.com>
 <20180202073750.t5gcqfp7cv7vdxiu@gauss3.secunet.de>
In-Reply-To: <20180202073750.t5gcqfp7cv7vdxiu@gauss3.secunet.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 02, 2018 at 08:37:50AM +0100, Steffen Klassert wrote:
> On Tue, Jan 30, 2018 at 02:53:48PM +0000, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > Pointer esph is being assigned a value that is never read, esph is
> > re-assigned and only read inside an if statement, hence the
> > initialization is redundant and can be removed.
> > 
> > Cleans up clang warning:
> > net/ipv4/esp4.c:657:21: warning: Value stored to 'esph' during
> > its initialization is never read
> > 
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> I've queued this for ipsec-next, will be applied
> after the merge window.

Now applied to ipsec-next, thanks!
