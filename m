From: Roland Dreier <rdreier@cisco.com>
Date: Thu, 03 Jun 2010 05:27:02 +0000
Subject: Re: [announce] smatch 1.54
Message-Id: <ada6320r8ih.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100109085325.GE7840@bicker>
	<adahblls0kx.fsf@roland-alpha.cisco.com>
	<20100602204147.GO5483@bicker>
In-Reply-To: <20100602204147.GO5483@bicker> (Dan Carpenter's message of "Wed,
	2 Jun 2010 22:41:47 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

 > Hm...  Apparently the bug is caused because I don't understand sparse
 > internals very well.  The following patch takes care of it, but I'll
 > need to look at it some more to make sure it's complete.

Thanks.  FWIW the patch gets rid of the false positives I was seeing
without introducing any obvious problems.

 - R.
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
