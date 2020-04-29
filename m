From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 09:50:25 +0000
Subject: Re: [PATCH 1/4 v2] firmware: stratix10-svc: Fix genpool creation error handling
Message-Id: <eb56faac-657a-e977-3be1-5f0a78ca509c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <660774ee8e63c03cb93a24d605c381eb0dce3b67.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <660774ee8e63c03cb93a24d605c381eb0dce3b67.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Richard Gong <richard.gong@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Tull <atull@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <mdf@kernel.org>

> 'svc_create_memory_pool()' returns an error pointer on error, not NULL.

Such information is helpful.


> Fix the corresponding test and return value accordingly.
>
> Move the genpool allocation after a few devm_kzalloc in order to ease
> error handling.

How do you think about a wording variant like the following?

   Change description:
   * Use a check of the failure predicate which is documented for
     the svc_create_memory_pool() function in the same source file.

   * Move the genpool allocation behind a few devm_kzalloc() calls
     in order to ease exception handling.

Regards,
Markus
