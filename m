From: Dmitry Torokhov <dtor_core@ameritech.net>
Date: Tue, 14 Mar 2006 05:32:08 +0000
Subject: [KJ] Re: [Patch] convert drivers/input to kzalloc() usage
Message-Id: <200603140032.08464.dtor_core@ameritech.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33317667865185974=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33317667865185974==
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Friday 24 February 2006 13:48, Eric Sesterhenn wrote:
> hi,
> 
> this converts drivers/input to kzalloc() usage, and cleans
> up two if blocks in input/mouse/hil_ptr.c
> Compile tested with allyesconfig.
> 

Applied, thank you Eric.

-- 
Dmitry

--===============33317667865185974==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33317667865185974==--
