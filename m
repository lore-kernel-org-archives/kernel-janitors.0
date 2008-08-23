From: Julia Lawall <julia@diku.dk>
Date: Sat, 23 Aug 2008 16:00:56 +0000
Subject: [PATCH 2/2] drivers/char/hvc_console.c: adjust call to put_tty_driver
Message-Id: <Pine.LNX.4.64.0808231800200.3162@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: paulus@samba.org, benh@kernel.crashing.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The call to put_tty_driver is out of place and is applied to the wrong
argument.

The function enclosing the patched code calls alloc_tty_driver and stores
the result in drv.  Subsequently, there are two occurrences of error
handling code, one making a goto to put_tty and one making a goto to
stop_thread.  At the point of the first one the assignment hvc_driver = drv
has not yet been executed, and from inspecting the rest of the file it
seems that hvc_driver would be NULL.  Thus the current call to
put_tty_driver is useless, and one applied to drv is needed.  The goto
stop_thread is in the error handling code for a call to
tty_register_driver, but the error cases in tty_register_driver do not free
its argument, so it should be done here.  Thus, I have moved the put_tty
label after the stop_thread label, so that put_tty_driver is called in both
cases.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@r exists@
local idexpression x;
expression E,f;
position p1,p2,p3;
identifier l;
statement S;
@@

x = alloc_tty_driver@p1(...)
...
if (x = NULL) S
... when != E = x
    when != put_tty_driver(x)
goto@p2 l;
... when != E = x
    when != f(...,x,...)
    when any
(
return \(0\|x\);
|
return@p3 ...;
)

@script:python@
p1 << r.p1;
p2 << r.p2;
p3 << r.p3;
@@

print "%s: call on line %s not freed or saved before return on line %s via line %s" % (p1[0].file,p1[0].line,p3[0].line,p2[0].line)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/hvc_console.c    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hvc_console.c b/drivers/char/hvc_console.c
index fd64137..ec7aded 100644
--- a/drivers/char/hvc_console.c
+++ b/drivers/char/hvc_console.c
@@ -819,11 +819,11 @@ static int hvc_init(void)
 	hvc_driver = drv;
 	return 0;
 
-put_tty:
-	put_tty_driver(hvc_driver);
 stop_thread:
 	kthread_stop(hvc_task);
 	hvc_task = NULL;
+put_tty:
+	put_tty_driver(drv);
 out:
 	return err;
 }
