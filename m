From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 08 Feb 2017 09:05:31 +0000
Subject: Re: [patch] mac80211: check for allocation failure in debugfs code
Message-Id: <1486544731.4603.11.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170207132052.GE27416@mwanda>
In-Reply-To: <20170207132052.GE27416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ben Greear <greearb@candelatech.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2017-02-07 at 16:20 +0300, Dan Carpenter wrote:
> kmalloc() can fail.  Also let's move the allocation out of the
> declaration block so it's easier to read.
> 
Applied, thanks.

johannes
