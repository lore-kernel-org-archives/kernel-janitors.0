From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Jul 2015 11:09:53 +0000
Subject: Re: [PATCH] parisc: mm: Fix a memory leak related to pmd not attached to the pgd
Message-Id: <20150714110953.GB5835@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1436779963-4286-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jejb@parisc-linux.org, deller@gmx.de, mpatocka@redhat.com, kirill.shutemov@linux.intel.com, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I assume you found this with Coccinelle?  Smatch can also find this bug
but you would need a cross compile environment set up.

regards,
dan carpenter

