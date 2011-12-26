From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 26 Dec 2011 12:18:54 +0000
Subject: Re: [PATCH 1/9] drivers/mfd/88pm860x-i2c.c: introduce missing
Message-Id: <alpine.DEB.2.02.1112261318050.1873@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk> <20111226120855.GB17760@sirena.org.uk>
In-Reply-To: <20111226120855.GB17760@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 26 Dec 2011, Mark Brown wrote:

> On Fri, Dec 23, 2011 at 06:39:26PM +0100, Julia Lawall wrote:
>> Error handling code following a kzalloc should free the allocated data.  At
>> this point, chip has been allocated and some fields have been initialized,
>> but it has not been stored anywhere, so it should be freed before leaving
>> the function.
>
> With this and probably a bunch of the other corrections in this series a
> conversion to devm_kazlloc() would be a more complete fix as it prevents
> people introducing similar missing cleanup paths in future.  Not sure if
> spatch can generate that automatically though...

I saw a patch for that recently, and looked into it a little bit, but I 
wasn't sure what should be done.  What are the criteria for using 
devm_kzalloc?

julia
