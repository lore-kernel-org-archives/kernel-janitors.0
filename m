From: Adrian Bunk <bunk@stusta.de>
Date: Mon, 07 Mar 2005 19:16:27 +0000
Subject: Re: [KJ] [PATCH] hcd.c
Message-Id: <20050307191627.GF3170@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============047017099888653213=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <54791.158.102.162.5.1110212817.squirrel@picard.linux.it>
In-Reply-To: <54791.158.102.162.5.1110212817.squirrel@picard.linux.it>
To: kernel-janitors@vger.kernel.org

--===============047017099888653213==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 07, 2005 at 05:26:57PM +0100, Carlo Perassi wrote:

> Hi.

Hi Carlo,

> I know this patch is not a clean solution but without it I got the
> following error
> 
> drivers/usb/core/hcd.c:131: error: parse error before '>>' token
> drivers/usb/core/hcd.c:131: error: initializer element is not constant
> drivers/usb/core/hcd.c:131: error: (near initialization for
> `usb2_rh_dev_descrip
> tor[12]')
> drivers/usb/core/hcd.c:131: error: parse error before '>>' token
> drivers/usb/core/hcd.c:131: error: initializer element is not constant
> drivers/usb/core/hcd.c:131: error: (near initialization for
> `usb2_rh_dev_descrip
> tor[13]')
> drivers/usb/core/hcd.c:154: error: parse error before '>>' token
> drivers/usb/core/hcd.c:154: error: initializer element is not constant
> drivers/usb/core/hcd.c:154: error: (near initialization for
> `usb11_rh_dev_descri
> ptor[12]')
> drivers/usb/core/hcd.c:154: error: parse error before '>>' token
> drivers/usb/core/hcd.c:154: error: initializer element is not constant
> drivers/usb/core/hcd.c:154: error: (near initialization for
> `usb11_rh_dev_descri
> ptor[13]')

this is a completely unmodified ftp.kernel.org kernel?

If yes, please send:
- your .config
- the output of
    bash scripts/ver_linux

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============047017099888653213==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============047017099888653213==--
