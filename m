From: Alessandro Rubini <rubini@gnudd.com>
Date: Wed, 19 Jun 2013 15:25:28 +0000
Subject: Re: [patch] FMC: NULL dereference on allocation failure
Message-Id: <20130619152528.GA16430@mail.gnudd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130619144904.GA10484@elgon.mountain> 
In-Reply-To: <20130619144904.GA10484@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> If we don't allocate "arr" then the cleanup path will dereference it and
> oops.

You are right, thanks (acked).

How is the procedure here? I don't have my own git tree on
kernel.org for pull requests. Can this go through the janitors?

(if it makes sense, I can try the procedure to have a tree, but last
time I checked it was strictly denied to anyone).

thanks
/alessandro
