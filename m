From: Domen Puncer <domen@coderock.org>
Date: Sat, 18 Sep 2004 21:19:52 +0000
Subject: [Kernel-janitors] Re: isdn/init: replace schedule_timeout() with
Message-Id: <20040918211952.GB3609@masina.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54989886574436508=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54989886574436508==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 17/09/04 10:56 -0700, Nishanth Aravamudan wrote:
> --- 2.6.9-rc2-vanilla/drivers/isdn/sc/init.c	2004-09-13 17:16:04.000000000 -0700
> +++ 2.6.9-rc2/drivers/isdn/sc/init.c	2004-09-17 10:54:58.000000000 -0700
> @@ -7,6 +7,7 @@
...
> -			set_current_state(TASK_INTERRUPTIBLE);
> -			schedule_timeout(milliseconds(10000));
> +			msleep_interruptible(msecs_to_jiffies(10000));

Should be without msecs_to_jiffies.


	Domen

--===============54989886574436508==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54989886574436508==--
