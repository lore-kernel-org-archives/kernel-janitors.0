From: Roland Dreier <rdreier@cisco.com>
Date: Wed, 02 Jun 2010 19:20:46 +0000
Subject: Re: [announce] smatch 1.54
Message-Id: <adahblls0kx.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100109085325.GE7840@bicker>
In-Reply-To: <20100109085325.GE7840@bicker> (Dan Carpenter's message of "Sat,
	9 Jan 2010 11:53:25 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

I'm trying out smatch on some kernel code now.  Neat stuff, but I'm
seeing some puzzling false positives relating to signedness.  Basically,
if I have code like:

	__be16 foo;
	__u16 bar;

	foo = cpu_to_be16(128);
	bar = cpu_to_be16(128);

then the first line warns about 32768 not fitting into foo, but while
the second line doesn't warn, even though __be16 is just a __bitwise__
__u16.  I don't understand the sparse / smatch internals so I'm not sure
why applying __bitwise__ apparently kills the unsigned modifier.  Maybe
it's an easy fix for you?  Otherwise I'll poke at it a little later.

Thanks,
  Roland
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
