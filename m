From: randy_dunlap <rdunlap@xenotime.net>
Date: Sun, 15 May 2005 17:21:11 +0000
Subject: Re: [KJ] [PATCH] Remove duplicate file in Documentation/networking
Message-Id: <20050515102111.280cd5fa.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8510938480605903=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050515092101.GA792@nuerscht.ch>
In-Reply-To: <20050515092101.GA792@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============8510938480605903==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 15 May 2005 11:21:01 +0200 Tobias Klauser wrote:

| The files wanpipe.txt and wan-router.txt in Documentation/networking
| contain the exact same information (diff between the two shows no
| difference). This patch removes wanpipe.txt since the title of the
| document is "Linux WAN Router Utilities Package" and therefor the
| name wan-router.txt is more appropriate.
| 
| Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>
| 
| diff -urpN -X dontdiff linux-2.6.12-rc4/Documentation/networking/wanpipe.txt linux-2.6.12-rc4-tk/Documentation/networking/wanpipe.txt
| --- linux-2.6.12-rc4/Documentation/networking/wanpipe.txt	2005-03-02 08:37:49.000000000 +0100
| +++ linux-2.6.12-rc4-tk/Documentation/networking/wanpipe.txt	1970-01-01 01:00:00.000000000 +0100


then you also need to do something about the file:
linux/Documentation/networking/00-INDEX, which contains:

wan-router.txt
	- Wan router documentation
wanpipe.txt
	- WANPIPE(tm) Multiprotocol WAN Driver for Linux WAN Router

---
~Randy
free agent

--===============8510938480605903==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8510938480605903==--
