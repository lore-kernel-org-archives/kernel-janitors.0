From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 27 Aug 2020 19:35:40 +0000
Subject: Re: [PATCH] memory: emif: Remove bogus debugfs error handling
Message-Id: <20200827193540.GA8837@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113759.GF393664@mwanda>
 <10387fe0-579a-de71-44ad-ac585ff604d6@oracle.com>
In-Reply-To: <10387fe0-579a-de71-44ad-ac585ff604d6@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: santosh.shilimkar@oracle.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Aug 26, 2020 at 09:52:37AM -0700, santosh.shilimkar@oracle.com wrote:
> On 8/26/20 4:37 AM, Dan Carpenter wrote:
> > Callers are generally not supposed to check the return values from
> > debugfs functions.  Debugfs functions never return NULL so this error
> > handling will never trigger.  (Historically debugfs functions used to
> > return a mix of NULL and error pointers but it was eventually deemed too
> > complicated for something which wasn't intended to be used in normal
> > situations).
> > 
> > Delete all the error handling.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> Looks good to me !!
> 
> Acked-by: Santosh Shilimkar <ssantosh@kernel.org>

Thanks, applied.

Santosh,
Your email does not match one in ack.  I understand this is just a
mistake so I put the ack.  However the tool (b4-am) ignores such cases
so ack could be lost in the future.

Best regards,
Krzysztof
