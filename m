From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 04 Oct 2005 19:55:09 +0000
Subject: Re: [KJ] [PATCH] kernel/audit.c char *foo="bar" -> char foo[]="bar"
Message-Id: <20051004200044.GA26563@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============031401308379726878=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20051004192032.GA10626@masoud.ir>
In-Reply-To: <20051004192032.GA10626@masoud.ir>
To: kernel-janitors@vger.kernel.org

--===============031401308379726878==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 04, 2005 at 03:20:32PM -0400, Masoud Sharbiani wrote:
> The patch below, converts the only instance of char *foo="constant"
> to char *foo[]="constant"

All gccs here agreed that the size of kernel/audit.o will become
smaller. Applied.

> --- a/kernel/audit.c
> +++ b/kernel/audit.c
> @@ -787,7 +787,7 @@ void audit_log_hex(struct audit_buffer *

> -	static const unsigned char *hex = "0123456789ABCDEF";
> +	static const unsigned char hex[] = "0123456789ABCDEF";


--===============031401308379726878==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============031401308379726878==--
