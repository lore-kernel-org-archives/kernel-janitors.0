From: Jiri Slaby <jirislaby@gmail.com>
Date: Sat, 13 Feb 2010 09:44:53 +0000
Subject: Re: [patch] staging: vt6655: rewrite CARDvUpdateBasicTopRate()
Message-Id: <4B767495.3010705@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100213080317.GJ14210@bicker>
In-Reply-To: <20100213080317.GJ14210@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 02/13/2010 10:36 AM, Jiri Slaby wrote:
> You cannot use ffs and fls here.

Actually you can (fls), if you add proper masks there like
fls(pDevice->wBasicRate & ((1 << RATE_24M) - 1) & ~((1 << RATE_6M) -
1)), but with some macro-ification inside. Dunno if it gets better though.

-- 
js
