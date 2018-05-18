From: David Miller <davem@davemloft.net>
Date: Fri, 18 May 2018 15:26:28 +0000
Subject: Re: [PATCH] hippi: fix spelling mistake: "Framming" -> "Framing"
Message-Id: <20180518.112628.2034204867850935787.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180518100922.28790-1-colin.king@canonical.com>
        <bdb779e6-1705-3607-7ad8-3b57dfcba31a@gmail.com>
In-Reply-To: <bdb779e6-1705-3607-7ad8-3b57dfcba31a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jes.sorensen@gmail.com
Cc: colin.king@canonical.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Jes Sorensen <jes.sorensen@gmail.com>
Date: Fri, 18 May 2018 10:33:50 -0400

> I do wonder if it's time to retire this driver and the HIPPI code. I
> haven't had access to hardware for over a decade so I have no idea
> if it even works anymore.

That's a good question.

If you really think nobody is using this stuff, yes we can remove it.

Then if someone brings it to our attention that there are users, we
can very easily bring it back.

But as the HIPPI maintiner it is really up to you.

