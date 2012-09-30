From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Sun, 30 Sep 2012 09:40:40 +0000
Subject: Re: [patch 2/3] remoteproc: snprintf() can return more than was printed
Message-Id: <CAK=WgbbgWicLygZgkkiSYOrCorKJB6Xr71uLX_4F_ZNwmszc7A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925070251.GC23009@elgon.mountain>
In-Reply-To: <20120925070251.GC23009@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 9:02 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> snprintf() returns the number of characters which would have been
> printed if there were enough space.  For example, on the first print if
> we fill up the 28 character string then it would return a number more
> than 30.  Use scnprintf() instead because that returns the actual number
> of characters printed.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks.
