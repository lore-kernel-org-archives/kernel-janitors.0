From: Domen Puncer <domen@coderock.org>
Date: Fri, 18 Mar 2005 14:04:51 +0000
Subject: Re: [KJ] [PATCH] printk : drivers/media/dvb/ttpci/av7110_ipack.c
Message-Id: <20050318140451.GE4006@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72025445060805948=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050318115049.GG17789@rhum.iomeda.fr>
In-Reply-To: <20050318115049.GG17789@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============72025445060805948==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18/03/05 12:50 +0100, Christophe Lucas wrote:
> 
> Hi,
> 
> Description:
> printk() calls should include appropriate KERN_* constant.

Doesn't apply to 2.6.11-rc1.

> 
> Have a nice day,

Can you drop this in patches otherwise someone else has to drop it (or
it ends in bitkeeper).
I already make script to strip "hi, hello, description, consider
applying...", i'm not adding every possible regard in there :-)


> -		printk ("Couldn't allocate memory for ipack\n");
> +		printk (KERN_WARNING "Couldn't allocate memory for ipack\n");

		      ^
You could get rid of this space.



--===============72025445060805948==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72025445060805948==--
