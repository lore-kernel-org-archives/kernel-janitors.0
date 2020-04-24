From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 24 Apr 2020 14:50:17 +0000
Subject: Re: [PATCH] scsi: fnic: Use kmalloc instead of vmalloc for a small memory allocation
Message-Id: <d9e5c4d7-43fd-13fd-688e-36f9f0d1466d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200423204620.26395-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Karan Tilak Kumar <kartilak@cisco.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, Satish Kharat <satishkh@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>

> 'struct fc_trace_flag_type' is just a few bytes long. There is no need
> to allocate such a structure with vmalloc. Using kmalloc instead.

Can such an adjustment be relevant for the specification of the tag “Fixes”?


> While at it, axe a useless test when freeing the memory.

I find it more appropriate to provide this source code improvement
by a separate update step.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=b4f633221f0aeac102e463a4be46a643b2e3b819#n138

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/scripts/coccinelle/free/ifnullfree.cocci?id=b4f633221f0aeac102e463a4be46a643b2e3b819#n4

Regards,
Markus
