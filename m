From: Gerd Knorr <kraxel@bytesex.org>
Date: Thu, 30 Sep 2004 08:27:48 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2-mm4 zr36120.c][5/8] Convert
Message-Id: <20040930082748.GC20456@bytesex>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53288360554587566=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <19730000.1096496900@w-hlinder.beaverton.ibm.com> <1096496127.16721.10.camel@localhost.localdomain> <24740000.1096500358@w-hlinder.beaverton.ibm.com>
In-Reply-To: <24740000.1096500358@w-hlinder.beaverton.ibm.com>
To: Hanna Linder <hannal@us.ibm.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@lists.osdl.org, greg@kroah.com

--===============53288360554587566==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> The whole driver is CONFIG_BROKEN anyway... I only verified my changes
> didn't add new compiler errors. What part should I remove? Just this check?

pci/quirks.c does these checks and sets the flags.
Replacing with a check for "pci_pci_problems & PCIPCI_TRITON" should do.

bttv does simliar things in bttv_check_chipset() (bttv-cards.c),
you might want to have a look there ...

  Gerd

-- 
return -ENOSIG;

--===============53288360554587566==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53288360554587566==--
