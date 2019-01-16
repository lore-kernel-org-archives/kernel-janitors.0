From: Christian Brauner <christian@brauner.io>
Date: Wed, 16 Jan 2019 08:45:13 +0000
Subject: Re: [PATCH -next v2] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <20190116084511.3vehgzruomfka6ve@brauner.io>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
 <1547627642-96450-1-git-send-email-weiyongjun1@huawei.com>
 <20190116084108.lubcpqaflkzmwfvp@brauner.io>
In-Reply-To: <20190116084108.lubcpqaflkzmwfvp@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com, maco@android.com, joel@joelfernandes.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 16, 2019 at 09:41:08AM +0100, Christian Brauner wrote:
> On Wed, Jan 16, 2019 at 08:34:02AM +0000, Wei Yongjun wrote:
> > Fix to return a negative error code -ENOMEM from the new_inode() and
> > d_make_root() error handling cases instead of 0, as done elsewhere in
> > this function.
> > 
> > Fixes: 3ad20fe393b3 ("binder: implement binderfs")
> 
> This should be:
> 
> Fixes: 849d540ddfcd ("binderfs: implement "max" mount option")
> 
> If you have added that feel free to also add my Reviewed-by.

Also, this does need to go into char-misc-linus and not -next so you can
drop the -next prefix from the [PATCH ...] prefix. :) Greg will do the
right thing in any case but it's just clearer if you don't add it. :)

Thanks!
Christian
