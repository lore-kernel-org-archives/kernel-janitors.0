From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Feb 2015 09:50:06 +0000
Subject: Re: [PATCH] net: Remove state argument from skb_find_text()
Message-Id: <20150218095006.GA5206@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1424184592-2441-1-git-send-email-prtvar.b@gmail.com>
In-Reply-To: <1424184592-2441-1-git-send-email-prtvar.b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 17, 2015 at 03:49:52PM +0100, Bojan Prtvar wrote:
> No need to pass textsearch state as argument to skb_find_text().
> Instead, it can be local variable.
> 
> Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
> ---
> This patch changes internal kernel API. I am sending it here first in hope to get some friendly review.

Hm...  That's odd.

This was added in commit 3fc7e8a6d842f ('[NET]: skb_find_text() -
Find a text pattern in skb data') and it's pretty clear that we're
deliberately passing an uninitialized struct.  Make sure that you CC
Thomas Graf <tgraf@suug.ch> on your email.

The only thing I can think of is that originally, we didn't do it your
way because we thought this would be called recursively and didn't want
to run out of stack space.  But it never has been called recursively so
your patch seems ok.

I hope you have tested this patch.  :)

Anyway, it seems like it should work to me.  I say forward it to netdev.
The worst that can happen is that you learn something.  :)

Maybe flesh out the commit message a bit.

regards,
dan carpenter

