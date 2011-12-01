From: Joe Perches <joe@perches.com>
Date: Thu, 01 Dec 2011 18:50:23 +0000
Subject: Re: [patch] Staging: lttng: dubious one-bit signed bitfields
Message-Id: <1322765423.30801.11.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20111201093746.GA1250@elgon.mountain>
In-Reply-To: <20111201093746.GA1250@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, 2011-12-01 at 10:56 +0100, walter harms wrote:
> hi,
> This patch looks ok to me but this design is ugly by itself.
> It should be replaced by an uchar uint whatever or use a
> real bool (obviously not preferred by this programmes).

bool:1 should work as well.
I doubt the space savings is worth much though.

