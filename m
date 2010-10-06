From: Anton Vorontsov <cbouatmailru@gmail.com>
Date: Wed, 06 Oct 2010 13:45:39 +0000
Subject: Re: [PATCH] power: makefile cleanup
Message-Id: <20101006134539.GA16839@oksana.dev.rtsoft.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
In-Reply-To: <1286351187-24245-1-git-send-email-mfm@muteddisk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matt mooney <mfm@muteddisk.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 06, 2010 at 12:46:27AM -0700, matt mooney wrote:
> Replace EXTRA_CFLAGS with ccflags-y; remove if-statements and replace
> with lists using the kbuild idiom.
> 
> None of the dependencies are modified.
> 
> Signed-off-by: matt mooney <mfm@muteddisk.com>
> ---

Applied, thanks!

-- 
Anton Vorontsov
email: cbouatmailru@gmail.com
irc://irc.freenode.net/bd2
