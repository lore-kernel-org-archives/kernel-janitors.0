From: David Howells <dhowells@redhat.com>
Date: Tue, 24 Jun 2008 10:21:16 +0000
Subject: Re: [PATCH 2/14] arch/frv: Eliminate NULL test and memset after alloc_bootmem
Message-Id: <7115.1214302876@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0806241021080.26777@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0806241021080.26777@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: dhowells@redhat.com, akinobu.mita@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall <julia@diku.dk> wrote:

> As noted by Akinobu Mita in patch b1fceac2b9e04d278316b2faddf276015fc06e3b,
> alloc_bootmem and related functions never return NULL and always return a
> zeroed region of memory.  Thus a NULL test or memset after calls to these
> functions is unnecessary.

Acked-by: David Howells <dhowells@redhat.com>
