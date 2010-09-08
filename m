From: Greg KH <gregkh@suse.de>
Date: Wed, 08 Sep 2010 00:23:47 +0000
Subject: Re: [PATCH 09/14] staging: westbridge: improve error path
Message-Id: <20100908002347.GE15785@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711573-7460-1-git-send-email-segooon@gmail.com> <4C849D78.9040202@bfs.de> <20100906203330.GE5162@suse.de> <4C85E6DE.3020409@bfs.de>
In-Reply-To: <4C85E6DE.3020409@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, David Cross <david.cross@cypress.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Tue, Sep 07, 2010 at 09:16:46AM +0200, walter harms wrote:
> 
> 
> Greg KH schrieb:
> > On Mon, Sep 06, 2010 at 09:51:20AM +0200, walter harms wrote:
> >> the indention should be fixed also.
> > 
> > Yes, the indentation for the whole file should be fixed, but that's not
> > what this patch was doing.
> > 
> > Remember, a patch should only do one thing at a time.
> > 
> 
> that is true,
> but in this special case i nearly missed the #if because it is so hidden
> in the code. IMHO that is enough for an exception.

This whole driver needs major help.  But again, one thing at a time
please.

thanks,

greg k-h
