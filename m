From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 10 May 2015 19:57:22 +0000
Subject: Re: type mismatch
Message-Id: <20150510195722.GG14154@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1505101517100.2645@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505101517100.2645@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I don't really have a strong opinion either way...  It's unlikely that
we will introduce a bug here and if we did, I think it would be caught
immediately in testing.

It's pretty common to treat the first member of a struct as special.
What annoys me is when people do

struct foo {
	int one, two, three;
	whatever;
};

memcpy(&foo.one, src, sizoef(struct foo));

Argh!?  These triger buffer overflows warnings in Smatch and I don't
see the point since &foo.one is less readable than &foo!  Oh well, I
think these were common enough, I had to treat it as idiomatic and add a
special case for them.

regards,
dan carpenter

