From: Oliver Neukum <oliver@neukum.org>
Date: Tue, 13 Jul 2004 18:53:17 +0000
Subject: [Kernel-janitors] Re: [linux-usb-devel] no set_current_state()
Message-Id: <200407132053.18110.oliver@neukum.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============69530626049886668=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============69530626049886668==
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit

Am Dienstag, 13. Juli 2004 19:52 schrieb Nishanth Aravamudan:
> Hi,
> 
> In continuing to replace, where appropriate, code with msleep() calls, I 
> ran across the following file(s) / function(s), which do not invoke 
> set_current_state() before schedule_timeout(), which causes the latter 
> to return immediately:
> 
> drivers/usb/media/dabusb.c::dabusb_open()
> 
> If someone could tell me which state (TASK_INTERRUPTIBLE or 
> TASK_UNINTERRUPTIBLE) is desired, I can fix this and perhaps replace the 
> calls with msleep().

TASK_INTERRUPTIBLE. It checks for pending signals. While you are at it,
try to move the check for nonblocking outside of the loop.

	HTH
		Oliver

--===============69530626049886668==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============69530626049886668==--
