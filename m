From: Henne <henne@nachtwindheim.de>
Date: Wed, 27 Jun 2007 17:19:49 +0000
Subject: Re: [KJ] [PATCH] scsi: Remove unnecessary cast of return value of
Message-Id: <46829C35.6030008@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4682CD1A020000F40000A89B@lucius.provo.novell.com>
In-Reply-To: <4682CD1A020000F40000A89B@lucius.provo.novell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Suresh,

thanks for the patch, but this one is malformed.

> -                carrp > -                    (ADV_CARR_T *) kmalloc(ADV_CARRIER_BUFSIZE,
> GFP_ATOMIC);
> +                carrp = kmalloc(ADV_CARRIER_BUFSIZE, GFP_ATOMIC);

GFP_ATOMIC); should be at the end of the 2nd line.
It seems that you Editor/Mailer isn't configured for sending patches,
or you edited the patch by hand (worse).
I'm not familiar with "Novell GroupWise Internet Agent", if thats your mailer.
But you may compare this patch in your outbox with the file you sent to find the one who's guilty ;)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
