From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 29 Apr 2020 12:41:12 +0000
Subject: Re: [PATCH 4/4 v2] firmware: stratix10-svc: Slightly simplify code
Message-Id: <75f9f165-cfa8-d43d-e7c0-17ccee673de5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <8c505c686438c54da61ad4fe15e1eae722011153.1588142343.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Richard Gong <richard.gong@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alan Tull <atull@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Moritz Fischer <mdf@kernel.org>

> Replace 'devm_kmalloc_array(... | __GFP_ZERO)' with the equivalent and
> shorter 'devm_kcalloc(...)'.
>
> 'ctrl->genpool' can not be NULL, so axe a useless test in the remove
> function.

I would find it clearer to integrate also such small source code improvements
by separate patches.

Regards,
Markus
