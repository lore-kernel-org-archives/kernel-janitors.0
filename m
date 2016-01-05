From: Heiko Carstens <heiko.carstens@de.ibm.com>
Date: Tue, 05 Jan 2016 07:54:46 +0000
Subject: Re: 390/qeth: Refactoring for qeth_core_set_online()
Message-Id: <20160105075446.GA3432@osiris>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688F13A.70601@users.sourceforge.net>
 <5688F1D0.3090502@users.sourceforge.net>
 <20160104113046.GE4179@osiris>
 <568A6F4A.1000206@users.sourceforge.net>
 <20160104140447.GG4179@osiris>
 <568A7D61.90703@users.sourceforge.net>
In-Reply-To: <568A7D61.90703@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-s390@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>, Ursula Braun <ubraun@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, Jan 04, 2016 at 03:10:41PM +0100, SF Markus Elfring wrote:
> > In this case the function body is very small
> > so I don't see any benefit at all.
> 
> Do you care for fine-tuning of variable placement occasionally?

No.

