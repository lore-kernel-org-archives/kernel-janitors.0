From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Dec 2016 13:15:20 +0000
Subject: alpha: Checking for a failed kmalloc() in process_reloc_for_got()?
Message-Id: <f5890058-e6e8-00ca-22c4-e1521cb5bf56@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1254"
Content-Transfer-Encoding: base64
To: linux-alpha@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>, Josh Poimboeuf <jpoimboe@redhat.com>, Matt Turner <mattst88@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Richard Henderson <rth@twiddle.net>, Rusty Russell <rusty@rustcorp.com.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

SGVsbG8sCgpBbm90aGVyIHJ1biBvZiBhIHNtYWxsIHNjcmlwdCBmb3IgdGhlIHNlbWFudGljIHBh
dGNoIGxhbmd1YWdlIChDb2NjaW5lbGxlKQpwb2ludGVkIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgZnVuY3Rpb24g4oCccHJvY2Vzc19yZWxvY19mb3JfZ2904oCdIG91dCBmb3IKZnVydGhlciBj
b25zaWRlcmF0aW9ucy4KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jZ2l0L2xpbnV4L2tlcm5lbC9n
aXQvbmV4dC9saW51eC1uZXh0LmdpdC90cmVlL2FyY2gvYWxwaGEva2VybmVsL21vZHVsZS5jP2lk
4DVmNTc0YTBiYjFmNDUwMmE0YjIyNjRmZGIwZWY2NDE5Y2YzNzcyI240MAoKV291bGQgaXQgYmUg
dXNlZnVsIHRvIGNoZWNrIHRoZSByZXR1cm4gdmFsdWUgZnJvbSBhIGNhbGwgb2YgdGhlCmZ1bmN0
aW9uIOKAnGttYWxsb2PigJ0gYWxzbyB0aGVyZT8KClJlZ2FyZHMsCk1hcmt1cwotLQpUbyB1bnN1
YnNjcmliZSBmcm9tIHRoaXMgbGlzdDogc2VuZCB0aGUgbGluZSAidW5zdWJzY3JpYmUga2VybmVs
LWphbml0b3JzIiBpbgp0aGUgYm9keSBvZiBhIG1lc3NhZ2UgdG8gbWFqb3Jkb21vQHZnZXIua2Vy
bmVsLm9yZwpNb3JlIG1ham9yZG9tbyBpbmZvIGF0ICBodHRwOi8vdmdlci5rZXJuZWwub3JnL21h
am9yZG9tby1pbmZvLmh0bWw=
