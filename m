From: Jeremy Kerr <jk@ozlabs.org>
Date: Thu, 26 Apr 2018 21:38:08 +0000
Subject: Re: [PATCH] serial/aspeed-vuart: fix a couple mod_timer() calls
Message-Id: <5a454ea3-9a5c-349c-f094-0f3eecf9cba2@ozlabs.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180426055055.GA9742@mwanda>
In-Reply-To: <20180426055055.GA9742@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

> The "unthrottle_timeout" is HZ/10 but mod_timer() takes a the actual
> jiffie where you want it to timeout, not an offset.

Ah, of course.

Acked-by: Jeremy Kerr <jk@ozlabs.org>

Cheers,


Jeremy
