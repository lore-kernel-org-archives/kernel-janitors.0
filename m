From: Rafael Pereira <rafael@kernelhacker.net>
Date: Wed, 19 Jan 2005 01:43:39 +0000
Subject: Re: [KJ] [PATCH] printk function
Message-Id: <1106099019.10797.5.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57700593863667793=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1106001987.20867.6.camel@localhost.localdomain>
In-Reply-To: <1106001987.20867.6.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============57700593863667793==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2005-01-18 at 13:33 +0200, Alexey Dobriyan wrote:

> Many more left. Double check that you aren't adding KERN_* in the _middle_ of
> a log message, ok? Also minimal splitting would be nice (arch/alpha/* part,
> kernel/* part, ...).
> 
> 	Alexey

Alexey,

Thank you for your comments. I'll do it better next time :)


Rafael.


-- 
 Rafael Pereira
 GNU/Linux Registered User #286151
 BSD Registered User #51196
 Be free. Use free software.


--===============57700593863667793==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57700593863667793==--
