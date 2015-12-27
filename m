From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 27 Dec 2015 16:24:02 +0000
Subject: Re: [Cocci] [PATCH v2] coccinelle: api: check for propagation of error from platform_get_irq
Message-Id: <568010A2.3000902@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1451157891-24881-1-git-send-email-Julia.Lawall@lip6.fr>
 <567EF188.7020203@cogentembedded.com>
 <alpine.DEB.2.02.1512262107340.2070@localhost6.localdomain6>
 <alpine.DEB.2.02.1512262123500.2070@localhost6.localdomain6>
 <567EF895.6080702@cogentembedded.com>
 <alpine.DEB.2.02.1512262156580.2070@localhost6.localdomain6>
 <567F9A29.50202@users.sourceforge.net>
 <alpine.DEB.2.02.1512271239460.2038@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1512271239460.2038@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cocci@systeme.lip6.fr

>> https://cwe.mitre.org/data/definitions/252.html
> 
> The value is not unchecked.

Would you like to express any stronger relationship between
the function call example and the occurrence of an if statement
by the discussed SmPL script?


> I made a specific rule because the specific problem is quite common.

Can it become also interesting to generalise this search pattern?

Regards,
Markus
