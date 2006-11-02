From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Thu, 02 Nov 2006 00:44:50 +0000
Subject: Re: [KJ] [PATCH] Correct misc_register return code handling in
Message-Id: <200611020144.51196.jesper.juhl@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061023171910.GA23714@hmsreliant.homelinux.net> <20061101161155.d7b30258.randy.dunlap@oracle.com> <20061101162727.72f1183b.akpm@osdl.org>
In-Reply-To: <20061101162727.72f1183b.akpm@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@osdl.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Neil Horman <nhorman@tuxdriver.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, kernel-janitors@lists.osdl.org, kjhall@us.ibm.com, maxk@qualcomm.com, linux-kernel@vger.kernel.org

On Thursday 02 November 2006 01:27, Andrew Morton wrote:
> On Wed, 1 Nov 2006 16:11:55 -0800
> Randy Dunlap <randy.dunlap@oracle.com> wrote:
> 
> > > Hmm, I guess that should be defined once and for all in
> > > Documentation/CodingStyle
> > 
> > I have some other CodingStyle changes to submit, but feel free
> > to write this one up.
> 
> Starting labels in column 2 gives me the creeps, personally.  But there's a
> decent justification for it.
> 
> > However, I didn't know that we had a known style for this, other
> > than "not indented so far that it's hidden".
> > 
> > If a label in column 0 [0-based :] confuses patch, then that's
> > a reason, I suppose.  I wasn't aware of that one...
> > In a case like that, we usually say "fix the tool then."
> 
> The problem is that `diff -p' screws up and displays the label: in the
> place where it should be displaying the function name.
> 
> Of course, lots of people forget the -p anyway...  Maybe we can fix those
> tools ;)
> 
Until the tools get fixed, how about applying this patch ?


Add CodngStyle info on labels.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
---

diff --git a/Documentation/CodingStyle b/Documentation/CodingStyle
index 29c1896..f8a3abb 100644
--- a/Documentation/CodingStyle
+++ b/Documentation/CodingStyle
@@ -566,6 +566,18 @@ result.  Typical examples would be funct
 NULL or the ERR_PTR mechanism to report failure.
 
 
+		Chapter 17: Labels
+
+Label names should be lowercase.
+
+Label names should start with a letter [a-z].
+
+Labels should not be placed at column 0. Doing so confuses some tools, most
+notably 'diff' and 'patch'. Instead place labels at column 1 (indented 1
+space). In some cases it's OK to indent labels one or more tabs, but
+generally it is prefered that labels be placed at column 1.
+
+
 
 		Appendix I: References
 



_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
