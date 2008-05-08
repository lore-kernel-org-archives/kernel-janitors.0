From: "Peter Teoh" <htmldeveloper@gmail.com>
Date: Thu, 08 May 2008 14:12:02 +0000
Subject: Re: kernel-testers - finding regressions in the kernel
Message-Id: <804dabb00805080712h6d8c282dy5efff381298acfeb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080507195830.GC32750@cs181133002.pp.htv.fi>
In-Reply-To: <20080507195830.GC32750@cs181133002.pp.htv.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Recently, I had two different problems:

a.   For a problem that started since somewher after 2.6.24-rc9 till
now, even with the sched-devel git version, the keyboard on entry on
my laptop will jump/skip some characters.   Sometimes even repeating
many times SUDDENLY when I just entered once.   That is for Dell
Inspiron 9300 (Intel ICH6 chipset, ie, already > 3 years old, with FC7
as the OS).   But no such problem for desktop (Intel/AMD alike).   But
I don't know what to capture in the kernel when such thing happened.

b.   For my Intel desktop (FC7, 2.6.25 as the kernel), few days ago it
just go into an extreme sluggish response mode....both mouse/keyboard
input will take a long time to response.   I really don't know how to
capture a snapshot of the kernel at that point.   It only happened
after running some heavy stuff like database server + firefox
downloading etc.

c.   Occasionally, my swap device will get disconnected, or corrupted,
and then the system (after some use) go into an extreme sluggish
response mode as well.   What happened?

Key question:   How to debug such problem?   How to capture kernel's
state when everything hanged?   How to capture the bootup message when
it crashed upon bootup?   (I used my digital camera)
