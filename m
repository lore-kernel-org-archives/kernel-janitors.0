From: Joe Perches <joe@perches.com>
Date: Sat, 17 Aug 2019 07:22:51 +0000
Subject: Re: [PATCH] clk: Remove extraneous 'for' word in comments
Message-Id: <74b4a00b524cf8dd11631692dee65ccbba34b8cb.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1566023759-7880-1-git-send-email-gupt21@gmail.com>
In-Reply-To: <1566023759-7880-1-git-send-email-gupt21@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rishi Gupta <gupt21@gmail.com>, sboyd@kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 2019-08-17 at 12:05 +0530, Rishi Gupta wrote:
> An extra 'for' word is grammatically incorrect in the comment
> 'verifying ops for multi-parent clks'. This commit removes
> this extra for word.

A few other repeated word typos in comments are 
common in the kernel and most could be changed.

$ git grep -P '^\s*/?\*.*\bthe the\b' | wc -l
285
$ git grep -P '^\s*/?\*.*\bto to\b' | wc -l
62
$ git grep -P '^\s*/?\*.*\bfor for\b' | wc -l
31
$ git grep -P
'^\s*/?\*.*\bfrom from\b' | wc -l
22
$ git grep -P '^\s*/?\*.*\bare are\b'
| wc -l
16
