From: David Howells <dhowells@redhat.com>
Date: Thu, 08 Nov 2007 17:21:17 +0000
Subject: Re: [PATCH] FRV - remove dead config symbol from FRV code
Message-Id: <26912.1194542477@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <47332668.7060301@gmail.com>
In-Reply-To: <47332668.7060301@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Jiri Olsa <olsajiri@gmail.com> wrote:

> remove dead config symbol from FRV code

Are you sure about that?

warthog>grep -r WANT_PAGE_VIRTUAL mm
mm/highmem.c:#endif     /* defined(CONFIG_HIGHMEM) && !defined(WANT_PAGE_VIRTUAL) */
mm/page_alloc.c:#ifdef WANT_PAGE_VIRTUAL

David
