From: Kirk True <kernel@kirkandsheila.com>
Date: Wed, 18 May 2005 08:07:48 +0000
Subject: Re: [KJ] [PATCH] Check return code for IBM Olympic /proc entry
Message-Id: <1116403668.1169.9.camel@itchy.kirkandsheila.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============43035492529289521=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1116400737.1169.1.camel@itchy.kirkandsheila.com>
In-Reply-To: <1116400737.1169.1.camel@itchy.kirkandsheila.com>
To: kernel-janitors@vger.kernel.org

--===============43035492529289521==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Christophe,

On Wed, 2005-05-18 at 09:44 +0200, Christophe Lucas wrote:
> Perhaps in the same patch you could put the right KERN_* values in
> printk();
> -			printk("Olympic: Network Monitor information: /proc/%s\n",proc_name); 
> +			printk(KERN_INFO "Olympic: Network Monitor information: /proc/%s\n",proc_name); 
> 
> and :
> 
> -			printk("Olympic: Network Monitor information: /proc/%s could not be created\n",proc_name); 
> +			printk(KERN_WARNING "Olympic: Network Monitor information: /proc/%s could not be created\n",proc_name); 

Yeah, I felt guilty not putting them in (creating just another thing to
clean up later), but I didn't want to change too much at once. I'll put
in what you suggest though.

BTW, did you see any line breaking issues (first janitors patch)? MARC
shows a bunch of '\' characters at the end of the long lines which I
don't see in the mailing list mail :\

Thanks!
Kirk


--===============43035492529289521==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============43035492529289521==--
