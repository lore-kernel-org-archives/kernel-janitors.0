From: Jonathan Corbet <corbet@lwn.net>
Date: Mon, 05 Aug 2013 16:52:14 +0000
Subject: Re: [PATCH] trivial: adjust code alignment
Message-Id: <20130805105214.14b77ced@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1375714059-29567-1-git-send-email-Julia.Lawall@lip6.fr>
	<1375714059-29567-5-git-send-email-Julia.Lawall@lip6.fr>
	<20130805160645.GI5051@mwanda>
	<alpine.DEB.2.02.1308051810360.2134@hadrien>
In-Reply-To: <alpine.DEB.2.02.1308051810360.2134@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, trivial@kernel.org, kernel-janitors@vger.kernel.org, m.chehab@samsung.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 5 Aug 2013 18:19:18 +0200 (CEST)
Julia Lawall <julia.lawall@lip6.fr> wrote:

> Oops, thanks for spotting that.  I'm not sure whether it is safe to abort 
> these calls as soon as the first one fails, but perhaps I could introduce 
> some more variables, and test them all afterwards.

Yes, it would be safe.  But it's hard to imagine a scenario where any of
those particular calls would fail that doesn't involve smoke.

The code is evidence of ancient laziness on my part.  I'll add fixing it
up to my list of things to do.

Thanks,

jon
