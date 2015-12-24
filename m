From: Jonathan Corbet <corbet@lwn.net>
Date: Thu, 24 Dec 2015 14:23:32 +0000
Subject: Re: [PATCH 3/3] Documentation-getdelays: Less function calls in usage()
Message-Id: <20151224072332.6df702b3@lwn.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	<567BE5AA.6070607@users.sourceforge.net>
	<567BE729.7030800@users.sourceforge.net>
In-Reply-To: <567BE729.7030800@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Thu, 24 Dec 2015 13:38:01 +0100
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> A single call of the fprintf() function is sufficient for the desired
> display of the usage information.

This seems like churn that doesn't actually fix anything.

jon
