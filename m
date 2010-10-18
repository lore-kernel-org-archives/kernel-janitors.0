From: Paulo Marques <pmarques@grupopie.com>
Date: Mon, 18 Oct 2010 18:09:18 +0000
Subject: Re: [PATCH 0/3] Use kasprintf
Message-Id: <4CBC8D4E.90008@grupopie.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287341311-11161-1-git-send-email-julia@diku.dk>
In-Reply-To: <1287341311-11161-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Julia Lawall wrote:
> These patches convert a sequence of kmalloc and memcpy to use kasprintf
> instead.

Aren't these patches just a more convoluted way of doing a kstrdup?

I would imagine that a kasprintf would make more sense when the format
string is more complex than "%s", or am I missing something?

-- 
Paulo Marques - www.grupopie.com

"The face of a child can say it all, especially the
mouth part of the face."
