From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 02 Sep 2019 17:24:50 +0000
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix condition in charge_threshold_store()
Message-Id: <20190902172450.GA3093@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190902143850.GA607@mwanda>
In-Reply-To: <20190902143850.GA607@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Sep 02, 2019 at 06:12:07PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 2, 2019 at 5:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > This error handling is reversed so we return early.
> >
> 
> I will squash to the original commit since it's not yet upstream.
> 
> Are you okay with this?
> 

Sure.  That's fine.

regards,
dan carpenter
