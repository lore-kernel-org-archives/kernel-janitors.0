From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Sun, 30 Sep 2012 09:45:25 +0000
Subject: Re: [patch 3/3] remoteproc: return -EFAULT on copy_from_user failure
Message-Id: <CAK=WgbZRq5UFWFoWxXTMP6aYLKQP4dZE=_2KJP-rD3irMfbtQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925070533.GD23009@elgon.mountain>
In-Reply-To: <20120925070533.GD23009@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 9:05 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> copy_from_user() returns the number of bytes remaining to be copied, but
> we want to return an error code here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
