From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 24 Dec 2015 14:22:51 +0000
Subject: Re: [PATCH 2/3] Documentation-getdelays: Apply a recommendation from "checkpatch.pl" in main()
Message-Id: <20151224072251.5dd190d0@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<567BE5AA.6070607@users.sourceforge.net>
	<567BE6E0.6040405@users.sourceforge.net>
In-Reply-To: <567BE6E0.6040405@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 24 Dec 2015 13:36:48 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> The script "checkpatch.pl" pointed out that assignments should usually
> not be performed within condition checks.
> Thus move the assignment for the variable "nl_sd" to a separate statement.

Fine, applied to the docs tree.

jon
