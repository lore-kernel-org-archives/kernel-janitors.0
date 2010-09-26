From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 26 Sep 2010 19:41:57 +0000
Subject: Re: [PATCH] staging: ft1000: fix error path
Message-Id: <20100926194156.GA25491@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1285491595-377-1-git-send-email-segooon@gmail.com>
 <20100926131151.GC6134@bicker>
In-Reply-To: <20100926131151.GC6134@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Marek Belisko <marek.belisko@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Sun, Sep 26, 2010 at 15:11 +0200, Dan Carpenter wrote:
> On Sun, Sep 26, 2010 at 12:59:55PM +0400, Vasiliy Kulikov wrote:
> > +err_free:
> > +	for (i--; i>=0; i--) {
> > +		kfree(pdpram_blk->pbuffer);
> > +		kfree(pdpram_blk);
> > +	}
> 
> This is wrong.

Of course, I'm very careless.  Pointers are linked into the list and the right code
should loop the list and free both pointers.  I'll post patch v2 tomorrow.

-- 
Vasiliy
