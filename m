From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 15 May 2005 18:10:37 +0000
Subject: Re: [KJ] [PATCH] Remove duplicate file in Documentation/networking
Message-Id: <20050515181037.GB792@nuerscht.ch>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============94596054584191513=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050515092101.GA792@nuerscht.ch>
In-Reply-To: <20050515092101.GA792@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============94596054584191513==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 15, 2005 at 10:21:11AM -0700, randy_dunlap wrote:
> On Sun, 15 May 2005 11:21:01 +0200 Tobias Klauser wrote:
> 
> | The files wanpipe.txt and wan-router.txt in Documentation/networking
> | contain the exact same information (diff between the two shows no
> | difference). This patch removes wanpipe.txt since the title of the
> | document is "Linux WAN Router Utilities Package" and therefor the
> | name wan-router.txt is more appropriate.
> | 
> | Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
> | 
> | diff -urpN -X dontdiff linux-2.6.12-rc4/Documentation/networking/wanpipe.txt linux-2.6.12-rc4-tk/Documentation/networking/wanpipe.txt
> | --- linux-2.6.12-rc4/Documentation/networking/wanpipe.txt	2005-03-02 08:37:49.000000000 +0100
> | +++ linux-2.6.12-rc4-tk/Documentation/networking/wanpipe.txt	1970-01-01 01:00:00.000000000 +0100
> 
> 
> then you also need to do something about the file:
> linux/Documentation/networking/00-INDEX, which contains:
> 
> wan-router.txt
> 	- Wan router documentation
> wanpipe.txt
> 	- WANPIPE(tm) Multiprotocol WAN Driver for Linux WAN Router

Thanks for catching this. Just to be sure I grepped the tree for
wanpipe.txt and found an appearance in drivers/net/wan/Kconfig

I'll send split-up patches in reply to this message.

Thanks, Tobias

--===============94596054584191513==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============94596054584191513==--
