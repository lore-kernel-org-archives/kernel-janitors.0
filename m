From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Sat, 03 Feb 2007 01:13:44 +0000
Subject: [KJ] [RFC] Regarding abs() and labs()
Message-Id: <45C3E1C8.2040105@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello all

Just took a look at abs() and can not understand why it seem so 
overcomplicated. Why not just:

#define abs(x)	((x) < 0) ? -(x) : (x))

and skip labs() (not used anyway)
+ it gives a warning with -W if x is of a unsigned type ("condition is 
always false" or similar).
But remember to use %u when printing an unsigned, took me a while before 
I understood how an unsigned could contain a "negative" value :)

Happy weekend
Richard Knutsson

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
