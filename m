From: Rob Herring <robh@kernel.org>
Date: Wed, 27 May 2020 18:40:40 +0000
Subject: Re: [PATCH v2] of: Fix a refcounting bug in __of_attach_node_sysfs()
Message-Id: <20200527184040.GA2529559@bogus>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520120414.GE172354@mwanda>
In-Reply-To: <20200520120414.GE172354@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>, Frank Rowand <frowand.list@gmail.com>

On Wed, 20 May 2020 15:04:14 +0300, Dan Carpenter wrote:
> The problem in this code is that if kobject_add() fails, then it should
> call of_node_put(np) to drop the reference count.  I've actually moved
> the of_node_get(np) later in the function to avoid needing to do clean
> up.
> 
> Fixes: 5b2c2f5a0ea3 ("of: overlay: add missing of_node_get() in __of_attach_node_sysfs")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: move the of_node_get() instead of doing clean up.  Also the v1 had a
>     confusing typo in the commit message.
> 
>  drivers/of/kobj.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Applied, thanks!
