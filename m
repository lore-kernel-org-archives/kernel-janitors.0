From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 16 Apr 2020 10:02:54 +0000
Subject: Re: [PATCH][next] drivers: hv: remove redundant assignment to pointer primary_channel
Message-Id: <20200416100253.GN1163@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200414152343.243166-1-colin.king@canonical.com>
 <87d08axb7k.fsf@vitty.brq.redhat.com>
 <606c442c-1923-77d4-c350-e06878172c44@canonical.com>
 <87wo6hvxkz.fsf@vitty.brq.redhat.com>
 <20200415143752.cm3xbesiuksfdbzm@debian>
In-Reply-To: <20200415143752.cm3xbesiuksfdbzm@debian>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Liu <wei.liu@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Colin Ian King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "K . Y . Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, linux-hyperv@vger.kernel.org

We have this discussion over and over.  I always say it helps to have
the commit mentioned in the commit message but it's not a Fixes tag.
So I think that the commit message should say something like
"commit 1234234 ("blah blah") removed some code so this variable isn't
used any more".  I think it helps the review process.  But then if we
mention the commit everyone says to use the Fixes tag.

It turns out if you leave out the commit entirely then people still
complain but a lot less frequently.  It shouldn't work that way but
reviewers are illogical.

regards,
dan carpenter
