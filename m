From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Tue, 17 Feb 2004 00:23:50 +0000
Subject: Re: [Kernel-janitors] new to kj and [PATCH] remove unneeded
Message-Id: <20040216162350.5ad9cd49.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 28 Jan 2004 15:34:36 +0100 Michael Veeck <veeck@informatik.uni-freiburg.de> wrote:

| Hi there!
| 
| As kj is suggested as a starting point for kernel hacking I looked 
| through the TODO-list and found some easy stuff (at least I hope so).
| 
| Greping through the latest kernel tree (2.6.2-rc2) showed two min / max 
| defines who don't need to be there and can be removed without compile 
| errors.
| 
| So, attached is the patch against 2.6.2-rc2.
| 
| Is it wise to post this also on the 'normal' kernel list or is it too 
| trivial for that?

drivers/scsi/ips.h has a ton of things that could be deleted,
not just min/max.  I'll wait for a better patch for that.

drivers/telephony/ixj.h -- I'll merge this part into the KJ patches.

Thanks.

--
~Randy
kernel-janitors project:  http://janitor.kernelnewbies.org/
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
