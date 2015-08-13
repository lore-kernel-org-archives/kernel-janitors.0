From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 13 Aug 2015 09:36:56 +0000
Subject: Re: [patch] mac80211: remove always true condition
Message-Id: <1439458616.2114.15.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150727081111.GB2937@mwanda>
In-Reply-To: <20150727081111.GB2937@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 2015-07-27 at 11:11 +0300, Dan Carpenter wrote:
> The outside if statement checks that IEEE80211_TX_INTFL_MLME_CONN_TX 
> is
> set so this condition is always true.  Checking twice upsets the 
> static
> checkers.
> 

Yeah, this was left over in some refactoring - thanks, applied.

johannes
