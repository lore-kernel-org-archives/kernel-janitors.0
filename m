From: Jean Delvare <khali@linux-fr.org>
Date: Tue, 03 Jan 2006 22:04:10 +0000
Subject: [KJ] Re: [PATCH] drivers/i2c: Use ARRAY_SIZE macro
Message-Id: <20060103230410.30638e26.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============082803688477248283=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============082803688477248283==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Tobias,

> Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]). Some trailing
> whitespaces are also removed.

Looks good. Applied, thanks!

-- 
Jean Delvare

--===============082803688477248283==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============082803688477248283==--
