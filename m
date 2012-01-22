From: Szymon Janc <szymon@janc.net.pl>
Date: Sun, 22 Jan 2012 18:52:42 +0000
Subject: Re: [PATCH v2 15/17] Staging: quickstart: Use pr_err and pr_info for logs
Message-Id: <201201221952.42591.szymon@janc.net.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi,

> Add a space please between KBUILD_MODNAME and the quoted string.
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

> 
> Please try not to break format strings into multiple bits.
> It's very error prone and can make it harder to grep.
> It's OK to have the line with the format exceed 80 chars.
> 
> 		pr_err("%s GHID method returned buffer of unexpected length %u\n",
> 		       quickstart->button->name, buffer.length);

Both issues fixed in V3.
Since there were no other comments for V2 patches I'm sending V3 for this 
patch only.

-- 
Szymon K. Janc
szymon@janc.net.pl

