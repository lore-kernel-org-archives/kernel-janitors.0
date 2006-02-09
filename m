From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 09 Feb 2006 00:06:29 +0000
Subject: Re: [KJ] Correct imprecise >= comparisons
Message-Id: <1139443589.30321.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67666780614830557=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
In-Reply-To: <20060208185312.GA26914@rhlx01.fht-esslingen.de>
To: kernel-janitors@vger.kernel.org

--===============67666780614830557==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

> in the kernel source tree, there are several places (less important ones
> and high-profile ones such as TCP/IP) which do "incorrect" checks such as:
> 
> if (val >= max)
>   val = max;
> 
> which can instead be expressed as
> 
> if (val > max)
>   val = max;
>
> in order to cut down on both executed cycles and cache write invalidation.

I am wondering if it is actually worth the effort, since it seems to
me as if this would normally be an exception that val >= max. And
instead of returning with an error or aborting you normalize the value.
Therefore the val=max statement is just executed pretty rarely, when an
user supplies a bad value for example. Even if there would be something
like

foo(int x){
	if (x>=2000)
		x=2000;
	// more code
}

bar (void){
	for (int i=0; i<4000; i++)
		foo(i);
}

you just win in one of the many cases...

Just my 2 Cents :)
Eric


--===============67666780614830557==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67666780614830557==--
