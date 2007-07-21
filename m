From: Matthew Wilcox <matthew@wil.cx>
Date: Sat, 21 Jul 2007 13:52:00 +0000
Subject: Re: [PATCH 1/2] run scripts/Lindent on it to match Documentation/CodingStyle
Message-Id: <20070721135200.GQ14791@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org> <46A0F282.8070103@simon.arlott.org.uk> <20070720180019.GJ14791@parisc-linux.org> <46A1A375.3020900@simon.arlott.org.uk>
In-Reply-To: <46A1A375.3020900@simon.arlott.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Simon Arlott <simon@fire.lp0.eu>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Jul 21, 2007 at 07:11:01AM +0100, Simon Arlott wrote:
> Changing the code to fix a utility bug is madness. I think it's been
> fixed too...

I just downloaded the source from CVS and it hasn't:

--- test1.c     2007-07-21 09:49:02.000000000 -0400
+++ test2.c     2007-07-21 09:49:12.000000000 -0400
@@ -8,5 +8,4 @@ flibble:
        zero
        one
-       two
        three
 }

Tell you what, why don't you fix it?  Here's how to get the source:
cvs -d:pserver:anonymous@cvs.sv.gnu.org:/sources/diffutils co diffutils

I'm sure you'll figure it out from there.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
