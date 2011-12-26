From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 26 Dec 2011 14:23:55 +0000
Subject: Re: devm_kfree
Message-Id: <20111226142354.GI8722@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk>
 <20111226120855.GB17760@sirena.org.uk>
 <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Julia Lawall <julia@diku.dk>, Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 26, 2011 at 02:44:58PM +0100, Julia Lawall wrote:
> Is it reasonable to use devm_kfree in a probe function that fails or
> a remove function that succeeds?

If we need to do this I'd suggest that we should be fixing the manager
to not need it rather than having drivers do this.
