From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 23 May 2015 10:14:28 +0000
Subject: Re: [PATCH v4 00/13] staging: lustre: lnet: code cleanups
Message-Id: <20150523101428.GX22558@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
 <20150522092142.GJ4150@mwanda>
 <CABqvwjsJXJYciMDHqy9vEdL6dGLhx3+Pi0_ro6192Z5SGR9Q_w@mail.gmail.com>
In-Reply-To: <CABqvwjsJXJYciMDHqy9vEdL6dGLhx3+Pi0_ro6192Z5SGR9Q_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Shuey <shuey@purdue.edu>
Cc: "Drokin, Oleg" <oleg.drokin@intel.com>, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-devel@lists.lustre.org

We would have applied the v3 patchset but now I don't know because we're
up to v5.  We can't apply v5 because there are problems with it.  No
one responded to v3 so Greg still might apply it or he might find these
email threads too scrambled and delete everything and ask for a resend.

It's pretty messed up so just wait for Greg to get to it before sending
more patches?

Basically you should only send patches which you assume will be applied.
If no one responds after 3 days then probably that means everyone from
the peanut gallery (Me, Sudip, Joe, the lustre devs), we don't have an
issue.  Then Greg does the last review (2-3 weeks later perhaps).  But
if it makes it past all the other reviews then generally Greg also will
be ok with it.

Greg applies patches in first come, first applied order.  If they don't
apply then you have to redo it.  He doesn't invest a lot of time into
figuring out why.  So you have to coordinate with the other devs, it's
up to you how you do that.

regards,
dan carpenter

