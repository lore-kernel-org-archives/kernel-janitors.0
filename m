From: Simon Arlott <simon@fire.lp0.eu>
Date: Sat, 21 Jul 2007 19:17:52 +0000
Subject: diffutils: C labels misdetected as functions (Was: [PATCH 1/2] run
Message-Id: <46A25BE0.7000104@simon.arlott.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1184489571313-git-send-email-crquan@gmail.com> <4699EEA9.6070709@simon.arlott.org.uk> <20070720170743.GF14791@parisc-linux.org> <46A0F282.8070103@simon.arlott.org.uk> <20070720180019.GJ14791@parisc-linux.org> <46A1A375.3020900@simon.arlott.org.uk> <20070721135200.GQ14791@parisc-linux.org>
In-Reply-To: <20070721135200.GQ14791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Denis Cheng <crquan@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

(Bcc: bug-gnu-utils@gnu.org)
The patch below stops diffutils treating C labels starting in column 1 as function names.

On 21/07/07 14:52, Matthew Wilcox wrote:
> On Sat, Jul 21, 2007 at 07:11:01AM +0100, Simon Arlott wrote:
>> Changing the code to fix a utility bug is madness. I think it's been
>> fixed too...
> 
> I just downloaded the source from CVS and it hasn't:
> 
> --- test1.c     2007-07-21 09:49:02.000000000 -0400
> +++ test2.c     2007-07-21 09:49:12.000000000 -0400
> @@ -8,5 +8,4 @@ flibble:
>         zero
>         one
> -       two
>         three
>  }
> 
> Tell you what, why don't you fix it?  Here's how to get the source:
> cvs -d:pserver:anonymous@cvs.sv.gnu.org:/sources/diffutils co diffutils
> 
> I'm sure you'll figure it out from there.
> 

---
Index: diff.c
=================================RCS file: /sources/diffutils/diffutils/src/diff.c,v
retrieving revision 1.45
diff -U 4 -r1.45 diff.c
--- diff.c	19 Jul 2007 17:45:29 -0000	1.45
+++ diff.c	21 Jul 2007 19:13:23 -0000
@@ -430,9 +430,9 @@
 	  break;

 	case 'p':
 	  show_c_function = true;
-	  add_regexp (&function_regexp_list, "^[[:alpha:]$_]");
+	  add_regexp (&function_regexp_list, "^[[:alpha:]$_](|.*[^:])$");
 	  break;

 	case 'P':
 	  unidirectional_new_file = true;


-- 
Simon Arlott
