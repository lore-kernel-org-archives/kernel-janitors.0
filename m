From: Greg KH <gregkh@suse.de>
Date: Mon, 06 Sep 2010 20:33:30 +0000
Subject: Re: [PATCH 09/14] staging: westbridge: improve error path
Message-Id: <20100906203330.GE5162@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283711573-7460-1-git-send-email-segooon@gmail.com> <4C849D78.9040202@bfs.de>
In-Reply-To: <4C849D78.9040202@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: walter harms <wharms@bfs.de>
Cc: Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, David Cross <david.cross@cypress.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

On Mon, Sep 06, 2010 at 09:51:20AM +0200, walter harms wrote:
> the indention should be fixed also.

Yes, the indentation for the whole file should be fixed, but that's not
what this patch was doing.

Remember, a patch should only do one thing at a time.

thanks,

greg k-h
