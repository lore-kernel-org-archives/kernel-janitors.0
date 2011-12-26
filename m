From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 26 Dec 2011 16:19:14 +0000
Subject: Re: devm_kfree
Message-Id: <20111226161913.GJ8722@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk>
 <20111226120855.GB17760@sirena.org.uk>
 <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6>
 <20111226142354.GI8722@opensource.wolfsonmicro.com>
 <alpine.DEB.2.02.1112261716310.1873@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1112261716310.1873@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 26, 2011 at 05:17:26PM +0100, Julia Lawall wrote:
> And I guess that eg using kfree to free something allocated using
> devm_kzalloc would be completely wrong, leading to a dangling
> pointer?

I'd expect that matching kfree() with devm_kzalloc() would lead to an
attempt to double free whenever the devm_ mechanism kicks in.
