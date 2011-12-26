From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 26 Dec 2011 16:17:26 +0000
Subject: Re: devm_kfree
Message-Id: <alpine.DEB.2.02.1112261716310.1873@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-1-git-send-email-julia@diku.dk> <20111226120855.GB17760@sirena.org.uk> <alpine.DEB.2.02.1112261440450.1873@localhost6.localdomain6> <20111226142354.GI8722@opensource.wolfsonmicro.com>
In-Reply-To: <20111226142354.GI8722@opensource.wolfsonmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

And I guess that eg using kfree to free something allocated using 
devm_kzalloc would be completely wrong, leading to a dangling pointer?

julia
