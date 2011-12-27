From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Tue, 27 Dec 2011 17:10:33 +0000
Subject: Re: [PATCH 1/2] scripts/coccinelle: semantic patches related to
Message-Id: <20111227171032.GA22729@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1325004092-28162-1-git-send-email-julia.lawall@lip6.fr>
In-Reply-To: <1325004092-28162-1-git-send-email-julia.lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, Gilles Muller <Gilles.Muller@lip6.fr>, Nicolas Palix <npalix.work@gmail.com>, cocci@diku.dk, linux-kernel@vger.kernel.org, mmarek@suse.cz

On Tue, Dec 27, 2011 at 05:41:31PM +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> From: Julia Lawall <Julia.Lawall@lip6.fr>

Something went wrong here?

> devm_ functions allocate memory that is to remain allocated until the
> device is detached.  This patch checks for opportunities for using the
> function devm_request_and_ioremap.

Note that devm_request_and_ioremap() is scheduled for merge in 3.3 so
patches based on this should probably wait until after that has been
merged.
