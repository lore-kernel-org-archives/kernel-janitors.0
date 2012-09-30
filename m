From: Ohad Ben-Cohen <ohad@wizery.com>
Date: Sun, 30 Sep 2012 09:28:27 +0000
Subject: Re: [patch 1/3] remoteproc: memory leak in rproc_handle_carveout()
Message-Id: <CAK=Wgbbk1MvH_ct8RLz+6bkG7fauBtUZeCVvB+yj68V0Kr9TNw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120925070156.GB23009@elgon.mountain>
In-Reply-To: <20120925070156.GB23009@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Sep 25, 2012 at 9:01 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We only need to allocate mapping if there is an rproc domain.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.  Handle with appropriate caution.

Applied, thanks.

I'm just changing the subject, because this actually fixes a sneaky
NULL-dereference and not a memory leak.
