From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 24 Dec 2015 14:22:10 +0000
Subject: Re: [PATCH 1/3] Documentation-getdelays: Fix a check for container file usage in main()
Message-Id: <20151224072210.15d6ee6c@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<567BE5AA.6070607@users.sourceforge.net>
	<567BE64C.4090604@users.sourceforge.net>
In-Reply-To: <567BE64C.4090604@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 24 Dec 2015 13:34:20 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> The close() function could be called by the main() function even if
> the passed variable "cfd" was assigned a negative value.
> 
> * Corresponding implementation details could be improved by adjustments
>   for jump targets according to the Linux coding style convention.
> 
> * Fix the affected condition check.

This seems more easily fixed by simply making the condition > 0.
Meanwhile, I'd really not add labels-inside-if-statements as an example
in the documentation tree.

Thanks,

jon
