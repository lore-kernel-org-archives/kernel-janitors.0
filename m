From: Alexey Dobriyan <adobriyan@mail.ru>
Date: Tue, 08 Mar 2005 22:12:34 +0000
Subject: Re: [KJ] [patch] fix typo in pm.h
Message-Id: <200503090111.14205.adobriyan@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56371382601031206=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <2cd57c90050308103414c5aef6@mail.gmail.com>
In-Reply-To: <2cd57c90050308103414c5aef6@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============56371382601031206==
Content-Disposition: inline
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

On Tuesday 08 March 2005 23:13, Nicolas Kaiser wrote:

> - * managment. Please avoid using them.  */
> + * management. Please avoid using them.  */

> - * We'll need to fix the drivers. So yes, putting 3 to all diferent defines is intentional,
> - * and will go away as soon as drivers are fixed. Also note that typedef is neccessary,
> + * We'll need to fix the drivers. So yes, putting 3 to all different defines is intentional,
> + * and will go away as soon as drivers are fixed. Also note that typedef is necessary,

Always grep the entire tree if typo is found. You know, identical keyboards,
people copy, ... ;-)

linux-2.6.11-bk4]$ grep managment -r . | wc -l
21

linux-2.6.11-bk4]$ grep neccessary -r . | wc -l
18

	Alexey

--===============56371382601031206==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56371382601031206==--
