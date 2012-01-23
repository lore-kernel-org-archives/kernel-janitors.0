From: Joe Perches <joe@perches.com>
Date: Mon, 23 Jan 2012 17:44:53 +0000
Subject: Re: [PATCH v2 15/17] Staging: quickstart: Use pr_err and pr_info for logs
Message-Id: <1327340693.1704.6.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
In-Reply-To: <1326320574-11220-17-git-send-email-szymon@janc.net.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 2012-01-23 at 14:13 -0200, Jorgyano Bruno wrote:
> (an html formatted reply)

html emails are rejected by kernel.org lists,
please use text-only.

> On Wed, Jan 11, 2012 at 9:58 PM, Joe Perches <joe@perches.com> wrote:
>         It's OK to have the line with the format exceed 80 chars.
> What about the 80-columns rule?
> is the strings an exception to the rule?
> when we should not to break the strings over 80 columns?

Formats should be unbroken where possible.
80 column wrapping should be ignored for format strings.
An exception might be a multi-line format (with multiple newlines)

	printk(KERN_LEVEL "long line 1\n"
	       "long line 2\n");


