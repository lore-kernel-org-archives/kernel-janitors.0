From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 28 Nov 2012 12:45:30 +0000
Subject: Re: [patch] mac80211: silence NULL dereference warning
Message-Id: <1354106730.9345.14.camel@jlt4.sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121127173119.GC1059@elgon.mountain>
In-Reply-To: <20121127173119.GC1059@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2012-11-27 at 20:31 +0300, Dan Carpenter wrote:
> Smatch complains that we could dereference skb later in the function.
> It's probably unlikely, but we may as well return here and avoid it.

Good catch, applied.

johannes

