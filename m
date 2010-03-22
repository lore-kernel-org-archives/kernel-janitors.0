From: David Howells <dhowells@redhat.com>
Date: Mon, 22 Mar 2010 12:47:17 +0000
Subject: Re: fscache: bug report: dereferencing before checking
Message-Id: <12453.1269262037@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100322120753.GE21571@bicker>
In-Reply-To: <20100322120753.GE21571@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <error27@gmail.com> wrote:

> Can "page" be NULL here?

Hmmm...  Interesting question.  I'm not sure it can be NULL.

radix_tree_gang_lookup_tag() finds pages in the tree that have a particular
tag set, and returns the number of pages it has selected.  If that number is
!= 1, then I don't proceed with accessing the array.

So I think the tests of page later are unnecessary.

David
