From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 18 Jul 2012 13:43:20 +0000
Subject: Re: Introduction and getting started...
Message-Id: <20120718134320.GA16291@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120718133104.GH2879@mcpierce-laptop.rdu.redhat.com>
In-Reply-To: <20120718133104.GH2879@mcpierce-laptop.rdu.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Jul 18, 2012 at 09:31:04AM -0400, Darryl L. Pierce wrote:
> Hi, everybody. I'm fairly new to this mailing list (just signed up last
> week) and want to start contributing in some fashion to Linux kernel
> development. But I'm not sure where or how to get started. So I'm asking
> for some advice: point me to a FAQ or guide for pitching in, please.
> 
> Thanks in advance.

The best way to start is just to fix bugs.  Try compiling the kernel
with the "clang" static checker stuff.  It should find some
potential bugs.  Sort through them and find which are real.  Then
fix them.

I don't think anyone is using the clang checker on a regular basis.

Run it against linux-next.

The key really is to read a lot of code and find bugs.

regards,
dan carpenter

