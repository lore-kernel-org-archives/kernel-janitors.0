From: David Howells <dhowells@redhat.com>
Date: Mon, 22 Mar 2010 12:05:20 +0000
Subject: Re: [patch] afs: potential null dereference
Message-Id: <28809.1269259520@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100320111938.GT5331@bicker>
In-Reply-To: <20100320111938.GT5331@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> It seems clear from the surrounding code that xpermits is allowed to be 
> NULL here.

Interesting.  The memcpy() won't oops due to this because if it is given a
NULL pointer, it will also be given a zero count.  I wonder if this means the
if-statement your patch adds is actually unnecessary...

David
