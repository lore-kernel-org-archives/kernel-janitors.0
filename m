From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 10 Mar 2004 15:57:31 +0000
Subject: [Kernel-janitors] Re: drop/ posix_timers_kmemcc.patch
Message-Id: <20040310075731.338af9df.rddunlap@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 10 Mar 2004 9:15:11 +0100 (Walter Harms) wrote:

| hi randi,
| please ask akpm to cast to void so the compiler and other
| ppl know that not checking the return value is ok.
| 
| IMHO: not checking return values is always an error
| Why was the patch droped ? to trivial ?

Hi Walter,

I don't understand what you are referring to above.
Which patch?  I don't see that in the posix_timers_kmemcc patch.
After we have that cleared up, we'll see whether we agree
on the rest of your comment.


This is the reply that I received for the fs/buffer.c
kmem_cache_create() failure patch.  I extended the reply to
other similar failures during init.

"Can't be bothered really.  It's a cant-happen-youre-dead-anyway thing,
and we'll get a nicely understandable oops later anyway."

--
~Randy


--- old/kernel/posix-timers.c   2004-01-24 12:08:04.151249424 +0100
+++ ./kernel/posix-timers.c       2004-01-24 12:09:42.486300224 +0100
@@ -191,6 +191,9 @@
 
 	posix_timers_cache = kmem_cache_create("posix_timers_cache",
 					sizeof (struct k_itimer), 0, 0, 0, 0);
+	if (!posix_timers_cache)
+		panic("Cannot create posix timers cache");
+
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
