From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 28 Aug 2017 07:09:18 +0000
Subject: Re: connector: Delete an error message for a failed memory allocation in cn_queue_alloc_callback_ent
Message-Id: <11fc2d4e-bcf4-9a1c-6d73-2e67aab2a1ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7b206228-b3e9-5cb9-873c-75b5d8aae23b@users.sourceforge.net>
 <E0D909EE5BB15A4699798539EA149D7F0779689E@ORSMSX103.amr.corp.intel.com>
In-Reply-To: <E0D909EE5BB15A4699798539EA149D7F0779689E@ORSMSX103.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Peter Waskiewicz Jr <peter.waskiewicz.jr@intel.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: Evgeniy Polyakov <zbr@ioremap.net>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Did coccinelle trip on the message

I suggest to reconsider this implementation detail with the combination
of a function call like “kzalloc”.
A script for the semantic patch language can point various update candidates
out according to a source code search pattern which is similar to “OOM_MESSAGE”
in the script “checkpatch.pl”.


> or the fact you weren't returning NULL?

How does this concern fit to my update suggestion?

Regards,
Markus
