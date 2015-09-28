From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Sep 2015 12:07:23 +0000
Subject: Re: [PATCH v2] coccinelle: assign signed result to unsigned variable
Message-Id: <56092D7B.4030106@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1509261106040.2737@hadrien>
 <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
In-Reply-To: <1443437687-16559-1-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

> +// Options: --include-headers --all-includes

How do you think about the reuse of the parameter "--recursive-includes" here?

Will the list of checked function calls become more complete then?

Regards,
Markus
