From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 19 Jan 2013 00:57:31 +0000
Subject: Re: [PATCH] staging: line6: fix use-after-free bug
Message-Id: <20130119005731.GA31941@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
In-Reply-To: <1358545934-13982-1-git-send-email-grabner@icg.tugraz.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 18, 2013 at 10:52:14PM +0100, Markus Grabner wrote:
> The function "line6_send_raw_message_async" now has an additional argument
> "bool copy", which indicates whether the supplied buffer should be copied into
> a dynamically allocated block of memory. The copy flag is also stored in the
> "message" struct such that the temporary memory can be freed when appropriate
> without intervention of the caller.

Why do this?  Why not either always copy it, or always not?  That would
make it simpler overall, right?

What is this fixing?

thanks,

greg k-h
