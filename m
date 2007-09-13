From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 13 Sep 2007 15:01:40 +0000
Subject: [PATCH][RFC] Drop the "static __initdata" from tmp_cmdline in
Message-Id: <Pine.LNX.4.64.0709131043070.4208@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


There appears to be no reason for the tmp_cmdline array to be
qualified as "static __initdata" since its value is apparently gone
once this routine ends.

Compile- and boot-time tested on i386.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  (i'm willing to be corrected on this one.)

  there's a bit of a story behind this.  as i was following the logic
for defining and processing kernel boot-time parameters, i was baffled
as to why that array was declared with "static __initdata", as if it
needed to retain its contents after the function returned.

  since parse_early_param() defines a static "done" variable that
guarantees that it can only ever be run once, there seemed to be no
point in retaining that copy of the command line once the command-line
parameters were processed.

  if you follow the logic, you eventually work your way down to the
routine do_early_param() which, given a parameter name and its value
(both strings), simply invokes:

...
 if (p->setup_func(val) != 0)
     printk(KERN_WARNING "Malformed early option '%s'\n", param);
...

which inspires the obvious question -- when a kernel parameter setup
routine is called, is it allowed to assume that the data at the value
address it's passed will remain *even after it returns*?  if not, then
it would seem that there is no reason for that "static __initdata".

  on the other hand, if any one of those setup routines *is* making
that assumption, then dropping that qualifier will definitely cause
bad things to happen somewhere down the road at some point in the boot
process.

  it seems like a trivial patch until you appreciate the possible
implications for all of those kernel parm setup routines defined in
all those calls to __setup() and early_param().  in essence, by
applying that patch, you'll find out who's cheating.

  thoughts?

p.s.  also, if it's not required, declaring it as "static __initdata"
is seriously confusing, since it gives the obvious impression that the
contents *need* to be retained, which just makes following the logic
that much harder if you're working under that misimpression.


diff --git a/init/main.c b/init/main.c
index 9def935..86d2ffc 100644
--- a/init/main.c
+++ b/init/main.c
@@ -482,7 +482,7 @@ static int __init do_early_param(char *param, char *val)
 void __init parse_early_param(void)
 {
 	static __initdata int done = 0;
-	static __initdata char tmp_cmdline[COMMAND_LINE_SIZE];
+	char tmp_cmdline[COMMAND_LINE_SIZE];

 	if (done)
 		return;


-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
====================================
