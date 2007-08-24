From: "Scott Thompson" <postfail@hushmail.com>
Date: Fri, 24 Aug 2007 19:31:21 +0000
Subject: Re: [PATCH] /drivers/char sx.c ioremap -> pci_ioremap api
Message-Id: <20070824193127.7E067C3825@mailserver10.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <46CF2849.2090008@gmail.com>
In-Reply-To: <46CF2849.2090008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jirislaby@gmail.com, alan@lxorguk.ukuu.org.uk
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 24 Aug 2007 15:15:30 -0400 Alan Cox 
<alan@lxorguk.ukuu.org.uk> wrote:
>ase, 0x80);
>> 
>> remove also the hwbase var.
>> 
>> > +	rebase = pci_iomap(pdev, 0, 0x80);
>> >   	t = readl(rebase + CNTRL_REG_OFFSET);
>
>Switch to ioread* if you are using the iomap interface. Its not a 
>trivial
>conversion and its slower and bulkier - the original ioremap was 
>much
>better
>
>NAK this change therefore

Jiri had requested this in relation to previous patch on unchecked 
ioremap return codes, but if the original ioremap is better NAK is 
fine
here and I won't resubmit w/ the hwbase var pulled out or the readl 
-> ioread32 switchover.

---------------------------------------
Scott Thompson / postfail@hushmail.com
---------------------------------------

