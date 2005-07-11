From: Domen Puncer <domen@coderock.org>
Date: Mon, 11 Jul 2005 17:08:46 +0000
Subject: Re: [KJ] [PATCH] toshiba_acpi check kmalloc return value
Message-Id: <20050711170846.GB2448@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67737679921685467=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1121044844.3554.25.camel@localhost>
In-Reply-To: <1121044844.3554.25.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============67737679921685467==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 11/07/05 17:55 +0200, walter harms wrote:
> ntl  perhaps add to the TODO list.
> 
> Check buffers that are used with copy_to_user() a really clean to avoid 
> information leakage.

Good idea, applied this:
--- TODO        19 Jun 2005 19:40:32 -0000      1.34
+++ TODO        11 Jul 2005 17:06:40 -0000
@@ -169,6 +169,7 @@
 - go through all the tty/serial drivers and make sure they don't give out
   excessively useful information to non CAP_SYS_RAWIO users, then loosen
   permissions. [D: http://lkml.org/lkml/2005/1/17/94]
+- check that buffers used in copy_to_user() don't leak information.
 - check for dev_close calls without rntl_lock held (causes assertion
   failures).
 - timer_del() vs. timer_del_sync()


--===============67737679921685467==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67737679921685467==--
