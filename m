From: Oliver Neukum <oliver@neukum.org>
Date: Tue, 13 Jul 2004 18:55:33 +0000
Subject: [Kernel-janitors] Re: [linux-usb-devel] no set_current_state()
Message-Id: <200407132055.33337.oliver@neukum.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70443411853755589=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407132053.18110.oliver@neukum.org>
In-Reply-To: <200407132053.18110.oliver@neukum.org>
To: kernel-janitors@vger.kernel.org

--===============70443411853755589==
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Am Dienstag, 13. Juli 2004 19:54 schrieb Nishanth Aravamudan:
> Hi,
> 
> In continuing to replace, where appropriate, code with msleep() calls, I 
> ran across the following file(s) / function(s), which do not invoke 
> set_current_state() before schedule_timeout(), which causes the latter 
> to return immediately:
> 
> drivers/usb/media/ov511.c::init_ov_sensor()

Should use msleep.

> drivers/usb/media/ov511.c::ov7xx0_configure()

also msleep

	HTH
		Oliver

--===============70443411853755589==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70443411853755589==--
