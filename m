From: Jesse Millan <jesse.millan@gmail.com>
Date: Thu, 26 May 2005 23:02:33 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning, def & len may be used uninitialized
Message-Id: <42965589.1020405@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4294CCEE.70907@comcast.net>
In-Reply-To: <4294CCEE.70907@comcast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


From now on, Ill initialize the parameters at the top/start of the
callee, unless it does not make sense to do so.

Thanks for the input.

Arnd Bergmann wrote:
> On Middeweken 25 Mai 2005 21:18, Jesse Millan wrote:
> 
>>Your right, it could go either way. Arnd Bergmann had posted earlier and
>>said that it would be better to make the change in the function itself.
>>I took that advice.
> 
> 
> I think what Mark was suggesting is to initialize the parameters at the
> start of the inner function (asn1_length_decode), which makes perfect
> sense to me, at least in this particular case.
> 
> What you should not do is initialize it in the calling function, because
> then you defeat gcc's ability to warn you about real uninitialized uses
> of the local variables in that function.
> 
> 	Arnd <><
> 

-- 
Jesse Millan
CNS Unix Team
Portland State University
Phone: (503) 725-9151
Mobile: (503) 453-0748
GPG key: www.system-calls.com/gpg.php

grep --recursive --ignore-case 'SHOULD WORK' /usr/src/linux/* | wc
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
