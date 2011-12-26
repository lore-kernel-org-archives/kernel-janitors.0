From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 26 Dec 2011 12:20:11 +0000
Subject: Re: [PATCH 1/9] drivers/mfd/88pm860x-i2c.c: introduce missing kfree
Message-Id: <20111226122011.GG8722@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk>
 <20111226120855.GB17760@sirena.org.uk>
 <alpine.DEB.2.02.1112261318050.1873@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1112261318050.1873@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Dec 26, 2011 at 01:18:54PM +0100, Julia Lawall wrote:
> On Mon, 26 Dec 2011, Mark Brown wrote:

> >With this and probably a bunch of the other corrections in this series a
> >conversion to devm_kazlloc() would be a more complete fix as it prevents
> >people introducing similar missing cleanup paths in future.  Not sure if
> >spatch can generate that automatically though...

> I saw a patch for that recently, and looked into it a little bit,
> but I wasn't sure what should be done.  What are the criteria for
> using devm_kzalloc?

It's good for any allocation that lasts for the lifetime of the device -
most driver data allocated in probe() fits well, for example.
