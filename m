From: Steffen Klassert <steffen.klassert@secunet.com>
Date: Mon, 28 Jan 2013 09:48:35 +0000
Subject: Re: [patch] padata: test correct variable in ->store function
Message-Id: <20130128094835.GO9147@secunet.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130126074946.GC14365@elgon.mountain>
In-Reply-To: <20130126074946.GC14365@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Dan Kruchinin <dkruchinin@acm.org>, linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 26, 2013 at 10:49:46AM +0300, Dan Carpenter wrote:
> It's testing for ->show but calling ->store().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Looks like a copy and paste error.

Acked-by: Steffen Klassert <steffen.klassert@secunet.com>

Herbert, are you going to take this one?

Thanks!
