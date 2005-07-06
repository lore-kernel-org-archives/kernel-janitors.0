From: Dave Jones <davej@redhat.com>
Date: Wed, 06 Jul 2005 18:01:02 +0000
Subject: Re: [KJ] stumped... implicitly truncated warning mystery
Message-Id: <20050706180101.GB24129@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0085638565498911134=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42CC197E.2030207@cs.pdx.edu>
In-Reply-To: <42CC197E.2030207@cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============0085638565498911134==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2005 at 10:48:46AM -0700, Jesse Millan wrote:
 > 
 > Hey all,
 > 
 > GCC4.0.0 is giving me a warning that I cant seem to get rid of. In the
 > file drivers/net/wireless/wavelan_cs.c on lines 3607 and 3608 is the
 > following assignment:
 > 
 > cfblk.ifrm_spc = 0x20;
 > cfblk.slottim_low = 0x20;
 > 
 > where ifrm_spc and slottim_low are both of type unsigned char.

No, look again.  They are bitfields.

  u_char        : 4,
     ifrm_spc   : 4;

4 bits isn't enough space to encode 0x20 which is 0b100000

  u_char        : 5,
     slottim_low : 3;

Likewise, 3 bits is too small.

		Dave


--===============0085638565498911134==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0085638565498911134==--
