From: Michael Still <mikal@stillhq.com>
Date: Wed, 14 Apr 2004 22:58:12 +0000
Subject: Re: [Kernel-janitors] [PATHC] fix ide.c warning
Message-Id: <407DC204.20200@stillhq.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2312267791831768=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200404140217.i3E2Hrgn023951@p-chan.krl.com>
In-Reply-To: <200404140217.i3E2Hrgn023951@p-chan.krl.com>
To: kernel-janitors@vger.kernel.org

--===============2312267791831768==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Luiz Fernando N. Capitulino wrote:

> | I would think it's much better form to either:
> | 
> |   - put the prototype in a header
> |   - repeat the prototype at the top of this file (there are risks here)
> 
>  I don't think is a good way to create a new .h file only to put
> one prototype there. include/linux/ide.h already does that for another ide
> functions, so it can be used (well, was what a quick look show me).

Hey, I don't really mind which header it goes in. If there is an 
existing suitable header, then that sounds like a good path.

Cheers,
Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 11                          |    -- Homer Simpson

--===============2312267791831768==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2312267791831768==--
