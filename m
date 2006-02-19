From: Jean Delvare <khali@linux-fr.org>
Date: Sun, 19 Feb 2006 18:21:56 +0000
Subject: Re: [KJ][Patch] alter prototypes in w83781d.c, w83627hf.c,
Message-Id: <20060219192156.ebf6750c.khali@linux-fr.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71218660782642895=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140187177.7789.79.camel@localhost.localdomain>
In-Reply-To: <1140187177.7789.79.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============71218660782642895==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Darren,

> To avoid me spamming you further here are the rest of the fixes for
> drivers/hwmon/
> 
> from http://linuxicc.sourceforge.net/
> 
> ICC complains about : Storage class not first.
> 
> In all these cases it appears to be because the prototype miss-names the
> reg variable as "register" which confuses ICC.
> 
> The patch below just re-names them all to reg which fits the actual
> functions.

I've merged all four patches in a single one, which I'll push to Greg
in the next batch of patches. Thanks!

-- 
Jean Delvare

--===============71218660782642895==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71218660782642895==--
