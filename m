From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 16 Sep 2004 12:03:04 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 3/33] char/drm_os_linux:
Message-Id: <1095336164.22739.3.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1188671918428299=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <41493C3D.6090403@tungstengraphics.com>
In-Reply-To: <41493C3D.6090403@tungstengraphics.com>
To: kernel-janitors@vger.kernel.org

--===============1188671918428299==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Iau, 2004-09-16 at 12:00, Dave Airlie wrote:
> I'll apply this to my tree and fix up the rest of them in the DRM, and
> push it to Linus..

Use __set_current_state() for these. set_current_state also includes a
memory barrier (ie its designed to be safe for all uses) while the DRI
code is already careful.

Alan


--===============1188671918428299==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1188671918428299==--
