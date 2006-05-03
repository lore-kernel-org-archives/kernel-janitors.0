From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Wed, 03 May 2006 20:00:21 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi: Use ARRAY_SIZE macro
Message-Id: <20060503200021.GA7564@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70788856007682188=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060501170024.GA1284@neon.tklauser.home>
In-Reply-To: <20060501170024.GA1284@neon.tklauser.home>
To: kernel-janitors@vger.kernel.org

--===============70788856007682188==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 01, 2006 at 07:00:24PM +0200, Tobias Klauser wrote:
> Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove
> duplicates of the macro.

Apparently you want to test how good I'm at removing unrelated pieces
from patches. Don't worry, my first were typed by hand on Windows 98
after reverse-engineering "diff -u" format, so you can't win. ;-)

Cleaned up version now lives

$ git branch
* ARRAY_SIZE	<= here
  BUG_ON
  kmemdup
  kzalloc
  origin


--===============70788856007682188==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70788856007682188==--
