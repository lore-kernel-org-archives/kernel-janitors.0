From: David Howells <dhowells@redhat.com>
Date: Thu, 02 May 2013 16:47:58 +0000
Subject: Re: [patch] atmel: printing bogus information
Message-Id: <11125.1367513278@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430075704.GH7237@elgon.mountain>
In-Reply-To: <20130430075704.GH7237@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, Simon Kelley <simon@thekelleys.org.uk>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There was an extra ';' character added to the end of the if statement
> which means that it always prints that the /proc entry wasn't created
> even though it was.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

The patches have gone upstream, so send it Linuswards.

Acked-by: David Howells <dhowells@redhat.com>
