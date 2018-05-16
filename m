From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Date: Wed, 16 May 2018 09:25:07 +0000
Subject: Re: [PATCH] cfg80211: Use correct GFP_ mask in cfg80211_del_sta_sinfo()
Message-Id: <87lgckymto.fsf@toke.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180516084836.GB23043@mwanda>
In-Reply-To: <20180516084836.GB23043@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> Smatch complains that we should use the passed in "gfp" instead of hard
> coding GFP_KERNEL.  I looked at some of the callers and this would
> probably be a bug for rtw_cfg80211_indicate_sta_disassoc() which uses
> GFP_ATOMIC and a NULL "sinfo".
>
> Fixes: 52539ca89f36 ("cfg80211: Expose TXQ stats and parameters to userspace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ah, right, didn't notice that that was supposed to be a gfp value.
Thanks for the fix :)

Acked-by: Toke Høiland-Jørgensen <toke@toke.dk>


-Toke
