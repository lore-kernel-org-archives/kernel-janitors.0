From: randy_dunlap <rdunlap@xenotime.net>
Date: Mon, 27 Jun 2005 18:29:07 +0000
Subject: Re: [KJ] SET_MODULE_OWNER(dev)
Message-Id: <20050627112907.3f61e283.rdunlap@xenotime.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98255822458671593=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200506271507.54410.victor@cetuc.puc-rio.br>
In-Reply-To: <200506271507.54410.victor@cetuc.puc-rio.br>
To: kernel-janitors@vger.kernel.org

--===============98255822458671593==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jun 2005 15:07:54 +0000 Victor wrote:

| Hi all!
| 
| Can anyone explain the reason for this line in
| linux-2.6.12/include/linux/netdevice.h:499:
| 	#define SET_MODULE_OWNER(dev) do { } while (0)
| 
| And why some net modules call SET_MODULE_OWNER(dev)?


for backwards compatibility with 2.4 kernels IIRC.

The netdev maintainers like to keep the net drivers
very similar for 2.4 and 2.6.

---
~Randy

--===============98255822458671593==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98255822458671593==--
