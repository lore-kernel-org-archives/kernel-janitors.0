From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Thu, 08 Jan 2004 00:45:16 +0000
Subject: Re: switch identation was: Re: [Kernel-janitors] [PATCH] Fix
Message-Id: <20040107164516.50bcd936.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 24 Dec 2003 01:44:25 -0000 "Luiz Capitulino" <lcapitulino@terra.com.br> wrote:

| 
| On 12/24/2003, "Arnaldo Carvalho de Melo" <acme@conectiva.com.br> wrote:
| 
| >Em Wed, Dec 24, 2003 at 01:29:15AM -0000, Luiz Capitulino escreveu:
| >>
| >> Hi Arnaldo,
| >>
| >> On 12/23/2003, "Arnaldo Carvalho de Melo" <acme@conectiva.com.br> wrote:
| >>
| >> >Em Tue, Dec 23, 2003 at 10:43:16AM -0200, Luiz Fernando Capitulino escreveu:
| >> >> +		switch(clocking) {
| >> >> +			case 0x03: printk("DISABLED !\n"); break;
| >> >> +			case 0x02: printk("= 2X PCI \n"); break;
| >> >> +			case 0x01: printk("= 133 \n"); break;
| >> >> +			case 0x00: printk("= 100 \n"); break;
| >> >> +		}
| >> >
| >> >May I suggest that we use:
| >> >
| >> >		switch(clocking) {
| >> >		case 0x03: printk("DISABLED !\n");	break;
| >> >		case 0x02: printk("= 2X PCI \n");	break;
| >> >		case 0x01: printk("= 133 \n");		break;
| >> >		case 0x00: printk("= 100 \n");		break;
| >> >		}
| >> >
| >> >That is how it is done in the networking code and most of the core (fs/,
| >> >kernel/) I've seen.
| >>
| >>  I can rediff, but the problem is that all the switch()s in siimage.c
| >> have the indention which I did.
| >>
| >>  Should I rediff ?

No.  But that
+	if(! pdev_is_sata(dev)) {
is really ugly (the spacing in "if(! " part of it).

And all this warning needs to fix it is an additional semi-colon, like:

-sata_skip:
+sata_skip:;

although I don't disapprove of the intent of your patch.

| >Ah, indeed having different styles in the same file is something awkward...
| >Perhaps you rediff and later submit a coding style patch converting the other
| >switches?
| 
|  I think is better let this patch with the some style of the file, and
| later I do a new patch which change all the switch()s (is what you
| said? :-))
| 
|  Should it be a new janitor task ?
| 
|  Add this rule to CodingStyle should be good too.

I prefer to use switch() formatting as acme has suggested, but
changing it in source files that are currently maintained should go
thru their maintainer(s) IMO.

For source files that are basically unmaintained, I don't mind
pushing formatting changes.

--
~Randy
MOTD:  Always include version info.


--
~Randy
MOTD:  Always include version info.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
