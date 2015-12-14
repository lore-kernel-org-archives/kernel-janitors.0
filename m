From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 14 Dec 2015 09:08:03 +0000
Subject: Re: [PATCH 2/7] staging: lustre: Rename a jump label for ptlrpc_req_finished() calls
Message-Id: <566E86F3.9010209@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <566D7733.1030102@users.sourceforge.net>
 <566D7884.5050407@users.sourceforge.net> <20151214065325.GS5284@mwanda>
In-Reply-To: <20151214065325.GS5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> Markus, please stop sending these things to rename out labels unless
> there is a bug.  CodingStyle allows out labels.

How does this feedback fit to information like the following?

"…
Chapter 7: …
…
Choose label names which say what the goto does or why the goto exists.
… Avoid using GW-BASIC names …
…"

Regards,
Markus
