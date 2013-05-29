From: Kent Overstreet <koverstreet@google.com>
Date: Wed, 29 May 2013 00:20:41 +0000
Subject: Re: [PATCH] md: bcache: io.c: fix a potential NULL pointer dereference
Message-Id: <20130529002041.GC2291@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1369726275-5424-1-git-send-email-gmate.amit@gmail.com>
In-Reply-To: <1369726275-5424-1-git-send-email-gmate.amit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Amit Mehta <gmate.amit-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: neilb-l3A5Bk7waGM@public.gmane.org, linux-bcache-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-raid-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Tue, May 28, 2013 at 12:31:15AM -0700, Kumar Amit Mehta wrote:
> bio_alloc_bioset returns NULL on failure. This fix adds a missing check
> for potential NULL pointer dereferencing.

Whoops, that's definitely a bug. Thanks, applied.

How'd you find it?
