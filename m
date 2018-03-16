From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 16 Mar 2018 15:53:27 +0000
Subject: Re: [PATCH] crypto: ccp: Use memdup_user() rather than duplicating its implementation
Message-Id: <20180316155327.GB7095@gondor.apana.org.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ccd82e60-ba87-d224-3662-365662fa4e6e@users.sourceforge.net>
In-Reply-To: <ccd82e60-ba87-d224-3662-365662fa4e6e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-crypto@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>, "David S. Miller" <davem@davemloft.net>, Gary Hook <gary.hook@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, Borislav Petkov <bp@suse.de>, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>

On Mon, Mar 05, 2018 at 02:10:20PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Mar 2018 13:50:13 +0100
> 
> Reuse existing functionality from memdup_user() instead of keeping
> duplicate source code.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
