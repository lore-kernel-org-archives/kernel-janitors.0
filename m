From: Pete Zaitcev <zaitcev@redhat.com>
Date: Tue, 13 Jul 2004 19:34:43 +0000
Subject: [Kernel-janitors] Re: [linux-usb-devel] no set_current_state()
Message-Id: <20040713123443.5af7dfd7@lembas.zaitcev.lan>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============92980167886231047=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200407132053.18110.oliver@neukum.org>
In-Reply-To: <200407132053.18110.oliver@neukum.org>
To: kernel-janitors@vger.kernel.org

--===============92980167886231047==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Jul 2004 20:57:14 +0200
Oliver Neukum <oliver@neukum.org> wrote:

> Am Dienstag, 13. Juli 2004 19:57 schrieb Nishanth Aravamudan:

> > In continuing to replace, where appropriate, code with msleep() calls, I 
> > ran across the following file(s) / function(s), which do not invoke 
> > set_current_state() before schedule_timeout(), which causes the latter 
> > to return immediately:
> > 
> > drivers/usb/misc/tiglusb.c::tiglusb_open()
> 
> TASK_INTERRUPTIBLE

In this case, Oliver is right. However, do not use TASK_INTERRUPTIBLE
in any path which is called from ->release(). When an application is
killed with ^C and is exiting, schedule() returns immediately if
called so, so the end result would be a fix with no effect.

-- Pete

--===============92980167886231047==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============92980167886231047==--
