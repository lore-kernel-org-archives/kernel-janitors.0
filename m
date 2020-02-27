From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 27 Feb 2020 15:38:55 +0000
Subject: Re: [PATCH v2] tee: amdtee: fix memory leak in amdtee_open_session()
Message-Id: <CAHUa44G_40N4u8bqsmMm3oTwY+o0sr0APbUe64igXH83dJdv6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224105139.b5nweo2guprmxteu@kili.mountain>
In-Reply-To: <20200224105139.b5nweo2guprmxteu@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 25, 2020 at 1:06 PM Rijo Thomas <Rijo-john.Thomas@amd.com> wrote:
>
>
>
> On 24/02/20 4:21 pm, Dan Carpenter wrote:
> > On these error paths the "sess" variable isn't freed.  It's a refcounted
> > pointer so we need to call kref_put().  I re-arranged the code a bit so
> > the error case is always handled before the success case and the error
> > paths are indented two tabs.
> >
> > Fixes: 757cc3e9ff1d ("tee: add AMD-TEE driver")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Reviewed-by: Rijo Thomas <Rijo-john.Thomas@amd.com>

I'm picking up this.

Thanks,
Jens
