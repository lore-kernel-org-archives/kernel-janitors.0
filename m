From: Joe Perches <joe@perches.com>
Date: Sun, 02 Jan 2011 21:25:21 +0000
Subject: Re: [PATCH 1/3] staging: keucr: Use memcmp() instead custom
Message-Id: <1294003521.23422.23.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
In-Reply-To: <1294002097-3058-2-git-send-email-martinez.javier@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 2011-01-02 at 22:21 +0100, Javier Martinez Canillas wrote:
> > This code isn't the same.
> > You deleted that return and now you do the driver ECC check.
> > Is that correct?
> You are right Joe, sorry for that. Should I remove the dead code after
> the return SUCCESS or keep it?

As I said before, I think you should delete it.

On Fri, 2010-12-31 at 12:26 -0800, Joe Perches wrote:
> You might as well take out useless code after returns
> instead of just changing function names.
> If you keep it you should reformat it.

Doesn't matter much though.

cheers, Joe

