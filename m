From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 15 Oct 2014 13:40:08 +0000
Subject: Re: [patch] [media] xc5000: use after free in release()
Message-Id: <20141015134008.GO26918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140925114008.GC3708@mwanda>
In-Reply-To: <20140925114008.GC3708@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <m.chehab@samsung.com>, Shuah Khan <shuah.kh@samsung.com>
Cc: Fabian Frederick <fabf@skynet.be>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 25, 2014 at 02:40:08PM +0300, Dan Carpenter wrote:
> I moved the call to hybrid_tuner_release_state(priv) after
> "priv->firmware" dereference.
> 
> Fixes: 5264a522a597 ('[media] media: tuner xc5000 - release firmwware from xc5000_release()')

We still need this patch.

regards,
dan carpenter

