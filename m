From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sat, 26 Nov 2005 20:27:02 +0000
Subject: Re: [KJ] polling in drivers/cdrom/aztcd.c
Message-Id: <20051126202702.GB30564@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19460564202096897=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <437DC19E.70407@comhem.se>
In-Reply-To: <437DC19E.70407@comhem.se>
To: kernel-janitors@vger.kernel.org

--===============19460564202096897==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2005 at 12:57:18PM +0100, Daniel Marjam?ki wrote:
> I saw this in version 2.6.14.1 of linux.
> Does anybody have any input on this matter?

Bzzrt... The thing was commented out 19 months ago.

#   2004/05/19 16:39:03-07:00 akpm
#   [PATCH] drivers/cdrom/aztcd.c warning fix.
#
#   From: "Luiz Fernando N. Capitulino"
#
#   drivers/cdrom/azctd.c:379: warning: `pa_ok' defined but not used

> static void pa_ok(void)
> {
>         aztTimeOutCount = 0;
>         do {
>                 aztIndatum = inb(DATA_PORT);
>                 aztTimeOutCount++;
>                 if (aztTimeOutCount >= AZT_TIMEOUT) {
>                         printk("aztcd: Error Wait PA_OK\n");
>                         break;
>                 }
>         } while (aztIndatum != AFL_PA_OK);
> }


--===============19460564202096897==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19460564202096897==--
