From: Stephan Peijnik <sp@sp.or.at>
Date: Tue, 21 Feb 2006 12:17:47 +0000
Subject: [KJ] gcc4 warnings, variable used uninitialized
Message-Id: <1140524267.2600.9.camel@omega.sp.or.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============069503723348759872=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============069503723348759872==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello list!

Does anyone know exactly how gcc4 decides whether a variable is
undefined or not and how that should be handled kernel-wise?

I've come across a few snippets where for example a temporary
u32 is declared and then a pointer to that variable is given
to pci_read_config_dword. When that variable is used afterwards gcc4
complains about it being not initialized (Using gcc-4.0.2 and kernel
2.6.16-rc4 as of yesterday).

Should 'bugs' like those be fixed? I've found like a gazillion of
them in the AGP drivers and other parts of the kernel.
I'm thinking about that as it seems to be the best point to get
myself started and I would appreciate comments on that topic.

Additionally, a comment on whether my last submitted patch is okay
(kauditd_thread not returning a value) would be nice aswell. Probably
including directions on where to send that patch to.

Thanks in advance.

Regards,

Stephan Peijnik


--===============069503723348759872==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============069503723348759872==--
