From: barrios <barrioskmc@gmail.com>
Date: Wed, 01 Aug 2007 04:34:10 +0000
Subject: Anyone is fixing with spin_lock_init?
Message-Id: <44c63dc40707312134k52e27402u43b5ce395973edc0@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi all

I am about staring kernel janitor project.
I make myself to fix following that

- convert all explicit lock initializations to spin_lock_init() or
rwlock_init().

Before starting my kernel hack, I read the janitor FAQ.
It said that

Q: What version should I be patching against?
A: Latest "linus" (2.6.x-rcY from kernel.org).
   Be sure to check -mm and -kj trees to see if someone already did that.

Currenty, lastest kernel version is 2.6.23-rc1.
But there are NOT any patch list about 2.6.23-rc1 in http://coderock.org/kj/
So How do I know that anyone already fix it ?


May I continue on fixing spin_lock of 2.6.23-rc1 ?
