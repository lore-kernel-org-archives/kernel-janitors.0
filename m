From: Michael Still <mikal@stillhq.com>
Date: Tue, 18 May 2004 00:03:25 +0000
Subject: Re: [Kernel-janitors] [PATCH] - fs/namespace.c::copy_namespace()
Message-Id: <40A952CD.7000407@stillhq.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============17948659448756721=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040517232335.GD6248@lorien.prodam>
In-Reply-To: <20040517232335.GD6248@lorien.prodam>
To: kernel-janitors@vger.kernel.org

--===============17948659448756721==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Luiz Fernando N. Capitulino wrote:

>  This patch is a little clean up, maybe it is the kind of
> thing which Randy could say: "is better work on important
> things". But it is impossible to read this code without
> patch it. :-)

I personally find the first version more readable -- now I need to look 
up to the top of the function to see the value of rc which is being 
returned.

Mikal

-- 

Michael Still (mikal@stillhq.com) | "All my life I've had one dream,
http://www.stillhq.com            |  to achieve my many goals"
UTC + 10                          |    -- Homer Simpson

--===============17948659448756721==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============17948659448756721==--
