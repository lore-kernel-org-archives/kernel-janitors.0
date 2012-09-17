From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Sep 2012 10:57:52 +0000
Subject: Re: [iio:wip] drivers/staging/iio/iio_input.c:189 iio_input_probe() error: don't call input_free_dev
Message-Id: <20120917105752.GH4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120915143547.GB7303@localhost>
In-Reply-To: <20120915143547.GB7303@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 15, 2012 at 10:35:47PM +0800, Fengguang Wu wrote:
> Hi Jonathan,
> 
> There is a smatch warning in tree
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git wip
> 
> + drivers/staging/iio/iio_input.c:189 iio_input_probe() error: don't call input_free_device() after input_unregister_device()
> 
> vim +189 drivers/staging/iio/iio_input.c
> 
>    186	error_unregister_input:
>    187		input_unregister_device(st->idev);
>    188	error_free_idev:
>  > 189		input_free_device(st->idev);

In this case, it's obvious that we do reference "st->idev" after
calling input_unregister_device() so this is a bug.  Normally way
people write this is to make input_register_device() the last call
in the probe() function which can fail.  In this case, it's a bit
awkward to do that it looks like.

Anyway, it's a double free bug because
input_register/unregister_device() is ref counted.

regards,
dan carpenter

