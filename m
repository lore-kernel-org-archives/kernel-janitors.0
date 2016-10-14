From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 14 Oct 2016 12:01:37 +0000
Subject: Re: [media] RedRat3: Move two assignments in redrat3_transmit_ir()?
Message-Id: <c6f74b6e-5270-f8da-41e9-5257b7253442@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <81cef537-4ad0-3a74-8bde-94707dcd03f4@users.sourceforge.net>
 <c5297c05-df30-8296-a767-99791c64b5c6@users.sourceforge.net>
 <20161014081524.GF5687@mwanda>
In-Reply-To: <20161014081524.GF5687@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Young <sean@mess.org>, Wolfram Sang <wsa-dev@sang-engineering.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> The original code was correct.

Your view can be appropriate for this function implementation to some degree.

I got the impression that it contains the specification of assignments
which will happen a bit too early here.
Is this a weakness for which software developers can care about?

Regards,
Markus
