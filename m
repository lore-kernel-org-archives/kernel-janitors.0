From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 22 Nov 2005 20:18:37 +0000
Subject: [KJ] Re: [PATCH] i2c: remove duplicate of BCD macros
Message-Id: <20051122211837.3205a7af.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32609948311182979=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32609948311182979==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Nicolas,

> Remove duplicate of BCD macros
> (...)
> --- a/drivers/i2c/chips/rtc8564.c	2005-11-04 17:36:24.000000000 +0100
> +++ b/drivers/i2c/chips/rtc8564.c	2005-11-22 13:08:08.000000000 +0100

Good catch, thanks for the patch. I'm enqueuing it.

-- 
Jean Delvare

--===============32609948311182979==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32609948311182979==--
