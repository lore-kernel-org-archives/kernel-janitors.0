From: tony@bakeyournoodle.com (Tony Breeds)
Date: Thu, 03 May 2007 00:25:28 +0000
Subject: Re: [KJ] git issue
Message-Id: <20070503002528.GC15955@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1178100601.25763.4.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1178100601.25763.4.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, May 02, 2007 at 03:40:01PM +0530, Vignesh Babu BM wrote:
> Is any one facing this problem:
> Im having Git version 1.5.0.6. When I try to do git clone...Im always
> ending up with a 404
> Error: could not interpret tags/v2.6.11 as something to pull
> 
> Im using
> http://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> also tried
> http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git
> 
> None of the files are downloaded. I cant access through git:// as Im
> behind a proxy.

Possibly not the most helpful of answers but git can go through some
proxy servers have a look at:
http://www.uwsg.iu.edu/hypermail/linux/kernel/0602.3/0795.html
for an example.

Yours Tony

  linux.conf.au        http://linux.conf.au/ || http://lca2008.linux.org.au/
  Jan 28 - Feb 02 2008 The Australian Linux Technical Conference!

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
