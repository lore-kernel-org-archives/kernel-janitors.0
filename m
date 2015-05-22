From: Joe Perches <joe@perches.com>
Date: Fri, 22 May 2015 03:06:05 +0000
Subject: Re: [PATCH v4 10/13] staging: lustre: lnet: lnet: checkpatch.pl fixes
Message-Id: <1432263965.20840.85.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
	 <CABqvwjs=S1VrCHe7M4JnDikGBVN3yqjNMrtSA=UvftGmxSasRQ@mail.gmail.com>
In-Reply-To: <CABqvwjs=S1VrCHe7M4JnDikGBVN3yqjNMrtSA=UvftGmxSasRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Shuey <shuey@purdue.edu>
Cc: "Drokin, Oleg" <oleg.drokin@intel.com>, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "hpdd-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>, lustre-deve@lists.lustre.org

On Thu, 2015-05-21 at 17:47 -0400, Michael Shuey wrote:
> Any suggestions on other checkpatch warnings?  Most of what remains are
> "don't introduce new typedefs" warnings - should these be removed as well,
> or am I safe to leave these?

I'm personally not a big fan of non-enum typedefs unless
the typedef hides some arch or size specific information
that's otherwise hard to handle.

I think struct/function/native type equivalent typedefs
are better removed.

coccinelle is a good tool for this.

I rather like enum typedefs, but that's not a common view
in lk land.

> I ask because these changes will be huge, and
> are unlikely to improve readability (but I don't know where the kernel
> community stands on having billions of typedefs everywhere.

I counted slightly less than billions.  I got 281.


