From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Mar 2019 13:29:24 +0000
Subject: Re: [PATCH] staging: ks7010: remove redundant auth_type check
Message-Id: <20190319132924.GA29424@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190318105749.20098-1-colin.king@canonical.com>
 <20190318213259.GC5362@azazel.net>
In-Reply-To: <20190318213259.GC5362@azazel.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeremy Sowden <jeremy@azazel.net>
Cc: Colin King <colin.king@canonical.com>, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Quytelda Kahja <quytelda@tamalin.org>

On Mon, Mar 18, 2019 at 09:32:59PM +0000, Jeremy Sowden wrote:
> On 2019-03-18, at 10:57:49 +0000, Colin King wrote:
> > The range check on auth_type is redundant as there is a prior
> > check on the auth_type values and the only way the block is entered
> > is if auth_type is one of TYPE_PMK1, TYPE_GMK1 and TYPE_GMK1.
> 
> "... and TYPE_GMK2."

I'll go edit that, thanks.

greg k-h
