From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, 16 Jan 2019 06:53:04 +0000
Subject: Re: [PATCH -next] binderfs: fix error return code in binderfs_fill_super()
Message-Id: <20190116065304.GA26290@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547607664-5612-1-git-send-email-weiyongjun1@huawei.com>
 <20190116062546.ufoeresnwz3wyxiu@brauner.io>
 <20190116062825.thzsb5edkihepgm4@brauner.io>
In-Reply-To: <20190116062825.thzsb5edkihepgm4@brauner.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Brauner <christian@brauner.io>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, devel@driverdev.osuosl.org, tkjos@android.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, arve@android.com, joel@joelfernandes.org, maco@android.com

On Wed, Jan 16, 2019 at 07:28:26AM +0100, Christian Brauner wrote:
> On Wed, Jan 16, 2019 at 07:25:46AM +0100, Christian Brauner wrote:
> > On Wed, Jan 16, 2019 at 03:01:04AM +0000, Wei Yongjun wrote:
> > > Fix to return a negative error code -ENOMEM from the new_inode() and
> > > d_make_root() error handling cases instead of 0, as done elsewhere in
> > > this function.
> > > 
> > > Fixes: 3ad20fe393b3 ("binder: implement binderfs")
> 
> This Fixes tag is technically wrong since this codepath was introduced
> by a commit that is still sitting in Greg's char-misc-linus branch. Not
> sure how to handle that though. Might just leave it.

Use the git commit id of the patch in that branch, it is not going to
change as I do not rebase that branch.

thanks,

greg k-h
