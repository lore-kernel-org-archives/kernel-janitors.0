From: Carlo Perassi <carlo@linux.it>
Date: Fri, 12 Nov 2004 10:27:29 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041112102729.GB5339@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17989631813524776=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============17989631813524776==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> How can an "unsigned" value every be less than zero?
> Didn't the compiler even warn you about this?

You are right but tg3_writephy (the original or the modified version)
does not contain the snippet the patch is referring to.
I'm going to see what is happened.
I will write later.
Thanks.

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============17989631813524776==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17989631813524776==--
